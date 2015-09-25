package com.surelution.wxmp.jx

import java.awt.Color
import java.awt.Graphics2D
import java.awt.image.BufferedImage
import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO

import org.codehaus.groovy.grails.commons.ConfigurationHolder

import com.google.zxing.BarcodeFormat
import com.google.zxing.EncodeHintType
import com.google.zxing.WriterException
import com.google.zxing.common.BitMatrix
import com.google.zxing.qrcode.QRCodeWriter
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel

class DynImageController {

    def file(Long id) {
        def path = ConfigurationHolder.config.app.file.upload.path
        File file = new File("${path}/${id}")
        def os = response.outputStream
        os << file.bytes
        os.flush()
        return
    }

    def qr(String id) {
        def os = response.outputStream
        int size = 200;
        String fileType = "png";
        try {
            Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<EncodeHintType, ErrorCorrectionLevel>();
            hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix byteMatrix = qrCodeWriter.encode(id,BarcodeFormat.QR_CODE, size, size, hintMap);
            int iWidth = byteMatrix.getWidth();
            BufferedImage image = new BufferedImage(iWidth, iWidth,
                    BufferedImage.TYPE_INT_RGB);
            image.createGraphics();

            Graphics2D graphics = (Graphics2D) image.getGraphics();
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, iWidth, iWidth);
            graphics.setColor(Color.BLACK);

            for (int i = 0; i < iWidth; i++) {
                for (int j = 0; j < iWidth; j++) {
                    if (byteMatrix.get(i, j)) {
                        graphics.fillRect(i, j, 1, 1);
                    }
                }
            }
            ImageIO.write(image, fileType, os);
            os.flush();
        } catch (WriterException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
