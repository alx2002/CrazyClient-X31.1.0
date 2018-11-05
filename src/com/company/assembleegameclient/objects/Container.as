﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//com.company.assembleegameclient.objects.Container

package com.company.assembleegameclient.objects
{
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import flash.display.GraphicsBitmapFill;
    import flash.display.GraphicsPath;
    import com.company.util.PointUtil;
    import com.company.assembleegameclient.sound.SoundEffectLibrary;
    import com.company.assembleegameclient.map.Map;
    import com.company.assembleegameclient.ui.panels.itemgrids.ContainerGrid;
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.ui.panels.Panel;
    import com.company.assembleegameclient.parameters.Parameters;
    import flash.display.IGraphicsData;
    import com.company.assembleegameclient.map.Camera;
    import com.company.assembleegameclient.ui.options.Options;
    import flash.geom.Matrix;
    import com.company.util.GraphicsUtil;
    import __AS3__.vec.*;

    public class Container extends GameObject implements IInteractiveObject 
    {

        public var isLoot_:Boolean;
        public var ownerId_:String;
        public var canHaveSoulbound_:Boolean;
        private var lastEquips:String = "rebuild";
        private var icons_:Vector.<BitmapData> = null;
        private var iconFills_:Vector.<GraphicsBitmapFill> = null;
        private var iconPaths_:Vector.<GraphicsPath> = null;
        public var drawMeBig_:Boolean;

        public function Container(_arg_1:XML)
        {
            super(_arg_1);
            isInteractive_ = true;
            this.isLoot_ = _arg_1.hasOwnProperty("Loot");
            this.canHaveSoulbound_ = _arg_1.hasOwnProperty("CanPutSoulboundObjects");
            this.ownerId_ = "";
        }

        public function setOwnerId(_arg_1:String):void
        {
            this.ownerId_ = _arg_1;
            isInteractive_ = ((this.ownerId_ == "") || (this.isBoundToCurrentAccount()));
        }

        public function lootNotify():void
        {
            var _local_1:Boolean;
            var _local_2:int;
            var _local_3:String;
            if ((((isInteractive_) && (!(objectType_ == 1284))) && (!(objectType_ == 1860))))
            {
                for each (_local_2 in equipment_)
                {
                    if (map_.player_.isWantedItem(_local_2))
                    {
                        if (_local_3 == null)
                        {
                            _local_3 = ObjectLibrary.getIdFromType(_local_2);
                            _local_1 = false;
                        }
                        else
                        {
                            _local_3 = ((_local_3 + "\n") + ObjectLibrary.getIdFromType(_local_2));
                        };
                    };
                };
                if (_local_3 != null)
                {
                    map_.player_.lootNotif(_local_3, this);
                };
            };
        }

        public function isBoundToCurrentAccount():Boolean
        {
            return (map_.player_.accountId_ == this.ownerId_);
        }

        override public function addTo(_arg_1:Map, _arg_2:Number, _arg_3:Number):Boolean
        {
            if ((!(super.addTo(_arg_1, _arg_2, _arg_3))))
            {
                return (false);
            };
            if (map_.player_ == null)
            {
                return (true);
            };
            var _local_4:Number = PointUtil.distanceXY(map_.player_.x_, map_.player_.y_, _arg_2, _arg_3);
            if (((this.isLoot_) && (_local_4 < 10)))
            {
                SoundEffectLibrary.play("loot_appears");
            };
            if (this.shouldSendBag(this.objectType_))
            {
                this.drawMeBig_ = true;
            };
            return (true);
        }

        private function shouldSendBag(_arg_1:int):Boolean
        {
            return (((((((_arg_1 >= 1287) && (_arg_1 <= 1289)) || (_arg_1 == 1291)) || (_arg_1 == 1292)) || ((_arg_1 >= 1294) && (_arg_1 <= 1296))) || (_arg_1 == 1708)) || ((_arg_1 >= 1722) && (_arg_1 <= 1728)));
        }

        public function getPanel(_arg_1:GameSprite):Panel
        {
            var _local_2:Player = (((_arg_1) && (_arg_1.map)) ? _arg_1.map.player_ : null);
            return (new ContainerGrid(this, _local_2));
        }

        override public function draw(_arg_1:Vector.<IGraphicsData>, _arg_2:Camera, _arg_3:int):void
        {
            super.draw(_arg_1, _arg_2, _arg_3);
            if (Parameters.data_.lootPreview)
            {
                this.drawItems(_arg_1, _arg_2, _arg_3);
            };
        }

        public function updateItemSprites(_arg_1:Vector.<BitmapData>):void
        {
            var _local_2:uint;
            var _local_3:* = null;
            var _local_4:int = -1;
            var _local_5:uint = this.equipment_.length;
            _local_2 = 0;
            while (_local_2 < _local_5)
            {
                _local_4 = this.equipment_[_local_2];
                _local_3 = ObjectLibrary.getItemIcon(_local_4);
                _arg_1.push(_local_3);
                _local_2++;
            };
        }

        public function drawItems(_arg_1:Vector.<IGraphicsData>, _arg_2:Camera, _arg_3:int):void
        {
            var _local_7:Number;
            var _local_8:Number;
            var _local_11:int;
            var _local_12:int;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_9:* = null;
            var _local_10:* = null;
            if (Options.hidden)
            {
                return;
            };
            if (this.icons_ == null)
            {
                this.icons_ = new Vector.<BitmapData>();
                this.iconFills_ = new Vector.<GraphicsBitmapFill>();
                this.iconPaths_ = new Vector.<GraphicsPath>();
                this.icons_.length = 0;
                this.updateItemSprites(this.icons_);
            }
            else
            {
                _local_10 = String(this.equipment_);
                if (_local_10 != this.lastEquips)
                {
                    this.icons_.length = 0;
                    this.lastEquips = _local_10;
                    this.updateItemSprites(this.icons_);
                };
            };
            var _local_13:Number = posS_[3];
            var _local_14:Number = this.vS_[1];
            _local_11 = 0;
            while (_local_11 < this.icons_.length)
            {
                _local_4 = this.icons_[_local_11];
                if (_local_11 >= this.iconFills_.length)
                {
                    this.iconFills_.push(new GraphicsBitmapFill(null, new Matrix(), false, false));
                    this.iconPaths_.push(new GraphicsPath(GraphicsUtil.QUAD_COMMANDS, new Vector.<Number>()));
                };
                _local_5 = this.iconFills_[_local_11];
                _local_6 = this.iconPaths_[_local_11];
                _local_5.bitmapData = _local_4;
                _local_12 = (_local_11 * 0.25);
                _local_7 = ((_local_13 - (_local_4.width * 2)) + ((_local_11 % 4) * _local_4.width));
                _local_8 = (((_local_14 - (_local_4.height * 0.5)) + (_local_12 * (_local_4.height + 5))) - ((_local_12 * 5) + 20));
                _local_6.data.length = 0;
                _local_6.data.push(_local_7, _local_8, (_local_7 + _local_4.width), _local_8, (_local_7 + _local_4.width), (_local_8 + _local_4.height), _local_7, (_local_8 + _local_4.height));
                _local_9 = _local_5.matrix;
                _local_9.identity();
                _local_9.translate(_local_7, _local_8);
                _arg_1.push(_local_5);
                _arg_1.push(_local_6);
                _arg_1.push(GraphicsUtil.END_FILL);
                _local_11++;
            };
        }


    }
}//package com.company.assembleegameclient.objects
