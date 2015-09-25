package com.surelution.wxmp.jx

class HorseGiftApply  {
	
	public static final String REFUSED_ID_SEEDS = "ERLWDGSUOIMXAYQVZBHNCPFJKT"

    static constraints = {
		subscriber unique:true 
		verifyCode nullable:true
		giftType nullable:true
		gasCard nullable:true
		gasCardApply nullable:true
		payer nullable:true
		replyInfo nullable:true
    }
	
	static mapping = {
		status column : '_status', enumType : "string"
		giftType enumType:'string'
	}

	PictureUploading uploading
	Subscriber subscriber
	ApplyStatus status
	String verifyCode
	GiftType giftType
	
	GasCardApply gasCardApply
	GasCard gasCard
	String replyInfo
	
	/**
	 * 礼品兑付人
	 */
	User payer
	
	static enum ApplyStatus {
		NEW, //上传图片完成，尚未提供卡片信息或卡片信息有误
		DETAILED_INFO, //提供了加油卡信息或办卡信息 
		APPROVED,  //图片合格，资料完整，发放兑奖码
		REJECTED, //图片不合格，提示用户再次上传图片
		UNLUCKLY, //没有抽中，提示用户下次参与。本次活动不能在参与了
		PAID //已兑付
		
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			KeyedMessage.findByKey("HorseGiftApply-ApplyStatus-${name()}").message
		}
	}

	static enum GiftType {
		APPLY_CARD, OLD_CARD, NOT_SET
	
		public String toString() {
			KeyedMessage.findByKey("HorseGiftApply-GiftType-${name()}").message
		}
	}
}
