﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//com.company.assembleegameclient.objects.Pet

package com.company.assembleegameclient.objects
{
    import kabam.rotmg.game.signals.TextPanelMessageUpdateSignal;
    import io.decagames.rotmg.pets.data.vo.PetVO;
    import com.company.assembleegameclient.util.AnimatedChar;
    import io.decagames.rotmg.pets.data.PetsModel;
    import kabam.rotmg.core.StaticInjectorContext;
    import com.company.assembleegameclient.ui.tooltip.TextToolTip;
    import kabam.rotmg.text.model.TextKey;
    import com.company.assembleegameclient.ui.tooltip.ToolTip;
    import com.company.assembleegameclient.map.Map;
    import io.decagames.rotmg.pets.panels.PetPanel;
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.ui.panels.Panel;
    import com.company.assembleegameclient.util.MaskedImage;
    import com.company.assembleegameclient.util.AnimatedChars;
    import com.company.assembleegameclient.ui.options.Options;
    import com.company.assembleegameclient.parameters.Parameters;
    import __AS3__.vec.Vector;
    import flash.display.IGraphicsData;
    import com.company.assembleegameclient.map.Camera;

    public class Pet extends GameObject implements IInteractiveObject 
    {

        private var textPanelUpdateSignal:TextPanelMessageUpdateSignal;
        public var vo:PetVO;
        public var skin:AnimatedChar;
        public var defaultSkin:AnimatedChar;
        public var skinId:int;
        public var isDefaultAnimatedChar:Boolean = false;
        public var petsModel:PetsModel;

        public function Pet(_arg_1:XML)
        {
            super(_arg_1);
            isInteractive_ = true;
            this.textPanelUpdateSignal = StaticInjectorContext.getInjector().getInstance(TextPanelMessageUpdateSignal);
            this.petsModel = StaticInjectorContext.getInjector().getInstance(PetsModel);
            this.petsModel.getActivePet();
        }

        public function getTooltip():ToolTip
        {
            return (new TextToolTip(0x363636, 0x9B9B9B, TextKey.CLOSEDGIFTCHEST_TITLE, TextKey.TEXTPANEL_GIFTCHESTISEMPTY, 200));
        }

        override public function addTo(_arg_1:Map, _arg_2:Number, _arg_3:Number):Boolean
        {
            if ((!(super.addTo(_arg_1, _arg_2, _arg_3))))
            {
                return (false);
            };
            var _local_4:GameObject = this.map_.goDict_[(this.objectId_ - 1)];
            if (((_local_4) && (_local_4 == this.map_.player_)))
            {
                myPet = true;
            };
            return (true);
        }

        public function getPanel(_arg_1:GameSprite):Panel
        {
            return (new PetPanel(_arg_1, this.vo));
        }

        public function setSkin(_arg_1:int):void
        {
            var _local_2:MaskedImage;
            this.skinId = _arg_1;
            var _local_3:XML = ObjectLibrary.getXMLfromId(ObjectLibrary.getIdFromType(_arg_1));
            var _local_4:String = _local_3.AnimatedTexture.File;
            var _local_5:int = _local_3.AnimatedTexture.Index;
            if (this.skin == null)
            {
                this.isDefaultAnimatedChar = true;
                this.skin = AnimatedChars.getAnimatedChar(_local_4, _local_5);
                this.defaultSkin = this.skin;
            }
            else
            {
                this.skin = AnimatedChars.getAnimatedChar(_local_4, _local_5);
            };
            this.isDefaultAnimatedChar = (this.skin == this.defaultSkin);
            _local_2 = this.skin.imageFromAngle(0, AnimatedChar.STAND, 0);
            animatedChar_ = this.skin;
            texture_ = _local_2.image_;
            mask_ = _local_2.mask_;
            var _local_6:ObjectProperties = ObjectLibrary.getPropsFromId(_local_3.DisplayId);
            if (_local_6)
            {
                props_.flying_ = _local_6.flying_;
                props_.whileMoving_ = _local_6.whileMoving_;
                flying_ = props_.flying_;
                z_ = props_.z_;
            };
        }

        override public function draw(_arg_1:Vector.<IGraphicsData>, _arg_2:Camera, _arg_3:int):void
        {
            if (((((Parameters.data_.showPets) || (Options.hidden)) || (this.map_.isPetYard)) || (myPet)))
            {
                super.draw(_arg_1, _arg_2, _arg_3);
            };
        }

        public function setDefaultSkin():void
        {
            var _local_1:MaskedImage;
            this.skinId = -1;
            if (this.defaultSkin == null)
            {
                return;
            };
            _local_1 = this.defaultSkin.imageFromAngle(0, AnimatedChar.STAND, 0);
            this.isDefaultAnimatedChar = true;
            animatedChar_ = this.defaultSkin;
            texture_ = _local_1.image_;
            mask_ = _local_1.mask_;
        }


    }
}//package com.company.assembleegameclient.objects
