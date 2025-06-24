import axios from 'axios';
import crypto from 'crypto';
import dotenv from "dotenv";
import nodemailer from "nodemailer";
import { Request, Response } from 'express';
import Orders from '../models/order.model';
import Tours from '../models/tours.model';

dotenv.config();

export const sendSuccessEmail = async (email: String, tourName: string, quantity: number, date: String) => {
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
      <h3>Chúc mừng bạn đã đặt tours thành công!</h3>
      <p><strong>Tour:</strong> ${tourName}</p>
      <p><strong>Số lượng:</strong> ${quantity}</p>
      <p><strong>Thời gian khởi hành:</strong> ${date}</p>
      <p>Chúc bạn có một chuyến đi thật vui vẻ!</p>
    `
  };

  await transporter.sendMail(mailOptions);
};

//[POST] /api/pays/payment
export const payment = async (req: Request, res: Response): Promise<void> => {
  const price = req.body.price;
  const id = req.body.orderID;
  const tourID = req.body.tourID;
  const userID = req.body.userID;
  const quantity = req.body.quantity;
  const email = req.body.email;
  const date = req.body.date;

  var accessKey = 'F8BBA842ECF85';
  var secretKey = 'K951B6PE1waDMi640xX08PD3vg6EkVlz';
  var orderInfo = 'pay with MoMo';
  var partnerCode = 'MOMO';
  var redirectUrl = `https://dc02-123-17-148-53.ngrok-free.app/success/${userID}`;
  var ipnUrl = 'https://1721-123-17-148-53.ngrok-free.app/api/pays/callback';
  var requestType = "payWithMethod";
  var amount = price;
  var orderId = id + "-" + tourID + "-" + quantity + "-" + new Date().getTime();
  var requestId = orderId;
  var extraData = ' ';
  var orderGroupId = ' ';
  var autoCapture = true;
  var lang = 'vi';

  // Tạo raw signature
  var rawSignature = `accessKey=${accessKey}&amount=${amount}&extraData=${extraData}&ipnUrl=${ipnUrl}&orderId=${orderId}&orderInfo=${orderInfo}&partnerCode=${partnerCode}&redirectUrl=${redirectUrl}&requestId=${requestId}&requestType=${requestType}`;

  const signature = crypto
    .createHmac('sha256', secretKey)
    .update(rawSignature)
    .digest('hex');

  const body = JSON.stringify({
    partnerCode,
    partnerName: "Test",
    storeId: "MomoTestStore",
    requestId,
    amount,
    orderId,
    orderInfo,
    redirectUrl,
    ipnUrl,
    lang,
    requestType,
    autoCapture,
    extraData,
    orderGroupId,
    signature
  });

  const options = {
    method: "POST",
    url: "https://test-payment.momo.vn/v2/gateway/api/create",
    headers: {
      'Content-Type': 'application/json',
      'Content-Length': Buffer.byteLength(body)
    },
    data: body
  }

  try {
    let result = await axios(options);
    res.status(200).json(result.data);
  } catch (error) {
    res.status(500).json({
      statusCode: 500,
      message: "server error"
    })
  }
};
//[POST] /api/pays/callback
export const callbackpay = async (req: Request, res: Response): Promise<void> => {
  const orderIDPay = parseInt(req.body.orderId.split('-')[0]);
  const tourID = parseInt(req.body.orderId.split('-')[1]);
  const quantity = parseInt(req.body.orderId.split('-')[2]);

  const checkPay = req.body.resultCode;
  if (checkPay === 0) {
    const order = await Orders.findOne({
      where: {
        id: orderIDPay
      }
    });
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

      await tour.update({
        stock: updateQuantity
      })

      await sendSuccessEmail(email, (tour as any).title, quantity, date);
    }
  }


  res.status(200).json(req.body)
}