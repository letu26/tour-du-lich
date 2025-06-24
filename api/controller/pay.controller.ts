import axios from 'axios';
// import crypto from 'crypto';
import dotenv from "dotenv";
import nodemailer from "nodemailer";
import CryptoJS from 'crypto-js';
import moment from 'moment';
import { Request, Response } from 'express';
import Orders from '../models/order.model';
import Tours from '../models/tours.model';

dotenv.config();

const config = {
  app_id: "2553",
  key1: "PcY4iZIKFCIdgZvA6ueMcMHHUbRLYjPL",
  key2: "kLtgPl8HHhfvMuDHPwKfgfsY4Ydm9eIz",
  endpoint: "https://sb-openapi.zalopay.vn/v2/create"
};

//gửi mail
export const sendSuccessEmail = async (email: String, tourName: string, quantity: number, date: String, name: String, place: String) => {
  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: process.env.USER,
      pass: process.env.PASSWORD
    }
  });

  const mailOptions = {
    from: process.env.USER,
    to: email,
    subject: '🎉 Đặt tour thành công!',
    html: `
        <h3 style="color: white; font-size: 20px; font-weight: 700; text-align: center; background: green; border-radius: 10px; padding: 10px 0;"}>Chúc mừng bạn đã đặt tours thành công!</h3>
        <p style="font-size: 16px; color: #555555; ">Dear:<span style="color: green; font-weight: 600;"> ${name}</span></p>
        <p style="font-size: 16px; color: #555555;"><span style="color: #0396FF;">Sky Tour</span> rất vui vì bạn đã tin tưởng và lựa chọn sử dụng dịch vụ đặt tour của chúng tôi, sau đây là các thông tin quan trọng về tour mà bạn đã đặt:</p>
        <p style="font-size: 16px;color: #555555">Tên tour:<strong style="font-weight: 600; color: #000;"> ${tourName}</strong></p>
        <p style="font-size: 16px;color: #555555">Số lượng vé:<strong style="font-weight: 600; color: #000;"> ${quantity}</strong > </p>
        <p style="font-size: 16px;color: #555555">Thời gian khởi hành:<strong style="font-weight: 600; color: #000;"> ${date}</strong> </p>
        <p style="font-size: 16px;color: #555555">Địa điểm khởi hành:<strong style="font-weight: 600; color: #000;"> ${place}</strong > </p>
        <p style="font-size: 16px;color: #555555">Chúc bạn có một chuyến đi thật vui vẻ! Nếu gặp vấn đề gì về dịch vụ, xin vui lòng liên hệ với chúng tôi sớm nhất để được giải quyết nhanh chóng, xin trân trọng cảm ơn.</p>
    `
  };

  await transporter.sendMail(mailOptions);
};

//[POST] /api/pays/payment
export const payment = async (req: Request, res: Response): Promise<void> => {
  const price = parseInt(req.body.price);
  const id = req.body.orderID;
  const tourID = req.body.tourID;
  const userID = req.body.userID;
  const quantity = req.body.quantity;

  const embed_data = {
    redirecturl: `https://e7a7-2405-4802-1cd4-7e0-c420-88b0-3a5e-9804.ngrok-free.app/success/${userID}`
  };

  const items = [{
    orderID: id,
    tourID,
    quantity
  }];

  const transID = Math.floor(Math.random() * 1000000);
  const order = {
    app_id: config.app_id,
    app_trans_id: `${moment().format('YYMMDD')}_${transID}`,
    app_user: "user123",
    app_time: Date.now(), // miliseconds
    item: JSON.stringify(items),
    embed_data: JSON.stringify(embed_data),
    amount: price,
    description: `SkyTour - Payment for the order #${transID}`,
    bank_code: "",
    callback_url: "https://tour-du-lich.onrender.com/api/pays/callback"
  };

  const data = config.app_id + "|" + order.app_trans_id + "|" + order.app_user + "|" + order.amount + "|" + order.app_time + "|" + order.embed_data + "|" + order.item;

  (order as any).mac = CryptoJS.HmacSHA256(data, config.key1).toString();

  try {
    const result = await axios.post(config.endpoint, null, { params: order });
    res.status(200).json(result.data);
  } catch (error) {
    console.log(error.message);
  }
};

//[POST] /api/pays/callback
export const callbackpay = async (req: Request, res: Response): Promise<void> => {
  let result = {};

  try {
    const dataStr = req.body.data;
    const reqMac = req.body.mac;
    const mac = CryptoJS.HmacSHA256(dataStr, config.key2).toString();
    const items = JSON.parse(JSON.parse(dataStr).item);
    const orderID = parseInt(items[0].orderID);
    const tourID = parseInt(items[0].tourID);
    const quantity = parseInt(items[0].quantity);

    // kiểm tra callback hợp lệ (đến từ ZaloPay server)
    if (reqMac !== mac) {
      // callback không hợp lệ
      (result as any).return_code = -1;
      (result as any).return_message = "mac not equal";
    }
    else {
      // thanh toán thành công
      //cập nhật trạng thái cho đơn hàng
      const order = await Orders.findOne({
        where: {
          id: orderID
        }
      })
      if (order) {
        await order.update({
          status: "active"
        })
      }
      const tour = await Tours.findOne({
        where: {
          id: tourID
        }
      })

      if (tour && order) {
        const updateQuantity = (tour as any).stock - Number(quantity);
        const email = (order as any).email;
        const date = (order as any).date;
        const name = (order as any).fullName;
        const place = (tour as any).startPlace;

        await tour.update({
          stock: updateQuantity
        })

        await sendSuccessEmail(email, (tour as any).title, quantity, date, name, place);
      }

      let dataJson = JSON.parse(dataStr, (config as any).key2);
      console.log("update order's status = success where app_trans_id =", dataJson["app_trans_id"]);

      (result as any).return_code = 1;
      (result as any).return_message = "success";
    }
  } catch (ex) {
    (result as any).return_code = 0; // ZaloPay server sẽ callback lại (tối đa 3 lần)
    (result as any).return_message = ex.message;
  }

  // thông báo kết quả cho ZaloPay server
  res.json(result);
};
