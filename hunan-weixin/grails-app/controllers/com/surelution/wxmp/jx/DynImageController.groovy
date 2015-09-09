package com.surelution.wxmp.jx

import grails.util.Holders

import java.awt.AlphaComposite
import java.awt.Color
import java.awt.Graphics2D
import java.awt.image.BufferedImage

import javax.imageio.ImageIO

import com.google.zxing.BarcodeFormat
import com.google.zxing.EncodeHintType
import com.google.zxing.WriterException
import com.google.zxing.common.BitMatrix
import com.google.zxing.qrcode.QRCodeWriter
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel

class DynImageController {

    def file(Long id) {
        def path = Holders.config.app.file.upload.path
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
	
	def station(Long id) {
		def gasStation = GasStation.get(id)
		int QRCODE_IMAGE_HEIGHT = 640
		int QRCODE_IMAGE_WIDTH = 640
		def content = gasStation?.subscribingUrl
		if(content) {
			def path = request.servletContext.getRealPath("/images/")
			def os = response.outputStream
			HashMap<EncodeHintType, ErrorCorrectionLevel> hints = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
			hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
			
			QRCodeWriter qrWriter = new QRCodeWriter();
			BitMatrix matrix = qrWriter.encode(content,
					BarcodeFormat.QR_CODE, QRCODE_IMAGE_WIDTH, QRCODE_IMAGE_HEIGHT,
					hints);
			BufferedImage image = new BufferedImage(QRCODE_IMAGE_WIDTH, QRCODE_IMAGE_HEIGHT,
					BufferedImage.TYPE_INT_RGB);
			image.createGraphics();
	
			Graphics2D graphics = (Graphics2D) image.getGraphics();
			graphics.setColor(Color.WHITE);
			graphics.fillRect(0, 0, QRCODE_IMAGE_WIDTH, QRCODE_IMAGE_HEIGHT);
			graphics.setColor(Color.BLACK);
	
			for (int i = 0; i < QRCODE_IMAGE_WIDTH; i++) {
				for (int j = 0; j < QRCODE_IMAGE_WIDTH; j++) {
					if (matrix.get(i, j)) {
						graphics.fillRect(i, j, 1, 1);
					}
				}
			}
			
			BufferedImage overlay = ImageIO.read(new File(path, "logo.png"));
	
			int deltaHeight = image.getHeight() - overlay.getHeight();
			int deltaWidth = image.getWidth() - overlay.getWidth();
	
			BufferedImage combined = new BufferedImage(QRCODE_IMAGE_HEIGHT,
					QRCODE_IMAGE_WIDTH, BufferedImage.TYPE_INT_ARGB);
			Graphics2D g = (Graphics2D) combined.getGraphics();
			g.drawImage(image, 0, 0, null);
			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1f));
			g.drawImage(overlay, (int) Math.round(deltaWidth / 2),
					(int) Math.round(deltaHeight / 2), null);
	
			ImageIO.write(combined, "PNG", os);
			os.flush()
		}
		
	}
	
}
