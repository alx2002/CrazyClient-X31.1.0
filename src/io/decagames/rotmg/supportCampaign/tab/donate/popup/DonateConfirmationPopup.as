﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//io.decagames.rotmg.supportCampaign.tab.donate.popup.DonateConfirmationPopup

package io.decagames.rotmg.supportCampaign.tab.donate.popup
{
    import io.decagames.rotmg.ui.popups.modal.ModalPopup;
    import io.decagames.rotmg.shop.ShopBuyButton;
    import io.decagames.rotmg.ui.sliceScaling.SliceScalingBitmap;
    import io.decagames.rotmg.ui.labels.UILabel;
    import io.decagames.rotmg.ui.defaults.DefaultLabelFormat;
    import flash.text.TextFormatAlign;
    import io.decagames.rotmg.ui.texture.TextureParser;

    public class DonateConfirmationPopup extends ModalPopup 
    {

        private var _donateButton:ShopBuyButton;
        private var supportIcon:SliceScalingBitmap;
        private var _gold:int;

        public function DonateConfirmationPopup(_arg_1:int, _arg_2:int)
        {
            var _local_3:SliceScalingBitmap;
            var _local_5:UILabel;
            super(240, 130, "Donate");
            this._gold = _arg_1;
            var _local_4:UILabel = new UILabel();
            _local_4.text = "You will receive:";
            DefaultLabelFormat.createLabelFormat(_local_4, 14, 0x999999, TextFormatAlign.CENTER, false);
            _local_4.wordWrap = true;
            _local_4.width = _contentWidth;
            _local_4.y = 5;
            addChild(_local_4);
            this.supportIcon = TextureParser.instance.getSliceScalingBitmap("UI", "campaign_Points");
            addChild(this.supportIcon);
            _local_5 = new UILabel();
            _local_5.text = _arg_2.toString();
            DefaultLabelFormat.createLabelFormat(_local_5, 22, 15585539, TextFormatAlign.CENTER, true);
            _local_5.x = (((_contentWidth / 2) - (_local_5.width / 2)) - 10);
            _local_5.y = 25;
            addChild(_local_5);
            this.supportIcon.y = (_local_5.y + 3);
            this.supportIcon.x = (_local_5.x + _local_5.width);
            var _local_6:UILabel = new UILabel();
            _local_6.text = "Supporter Points";
            DefaultLabelFormat.createLabelFormat(_local_6, 14, 0x999999, TextFormatAlign.CENTER, false);
            _local_6.wordWrap = true;
            _local_6.width = _contentWidth;
            _local_6.y = 50;
            addChild(_local_6);
            _local_3 = new TextureParser().getSliceScalingBitmap("UI", "main_button_decoration", 148);
            addChild(_local_3);
            this._donateButton = new ShopBuyButton(_arg_1);
            this._donateButton.width = (_local_3.width - 45);
            addChild(this._donateButton);
            _local_3.y = (_contentHeight - 50);
            _local_3.x = Math.round(((_contentWidth - _local_3.width) / 2));
            this._donateButton.y = (_local_3.y + 6);
            this._donateButton.x = (_local_3.x + 22);
        }

        public function get donateButton():ShopBuyButton
        {
            return (this._donateButton);
        }

        public function get gold():int
        {
            return (this._gold);
        }


    }
}//package io.decagames.rotmg.supportCampaign.tab.donate.popup
