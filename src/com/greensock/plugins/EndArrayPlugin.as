﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//com.greensock.plugins.EndArrayPlugin

package com.greensock.plugins
{
    import com.greensock.TweenLite;

    public class EndArrayPlugin extends TweenPlugin 
    {

        public static const API:Number = 2;

        protected var _a:Array;
        protected var _info:Array = [];
        protected var _round:Boolean;

        public function EndArrayPlugin()
        {
            super("endArray");
        }

        override public function _roundProps(_arg_1:Object, _arg_2:Boolean=true):void
        {
            if (("endArray" in _arg_1))
            {
                this._round = _arg_2;
            };
        }

        public function _init(_arg_1:Array, _arg_2:Array):void
        {
            var _local_4:int;
            var _local_5:*;
            this._a = _arg_1;
            var _local_3:int = _arg_2.length;
            while (--_local_3 > -1)
            {
                if (((!(_arg_1[_local_3] == _arg_2[_local_3])) && (!(_arg_1[_local_3] == null))))
                {
                    _local_5 = _local_4++;
                    this._info[_local_5] = new ArrayTweenInfo(_local_3, this._a[_local_3], (_arg_2[_local_3] - this._a[_local_3]));
                };
            };
        }

        override public function setRatio(_arg_1:Number):void
        {
            var _local_2:ArrayTweenInfo;
            var _local_3:Number;
            var _local_4:int = this._info.length;
            if (this._round)
            {
                while (--_local_4 > -1)
                {
                    _local_2 = this._info[_local_4];
                    this._a[_local_2.i] = (((_local_3 = ((_local_2.c * _arg_1) + _local_2.s)) > 0) ? ((_local_3 + 0.5) >> 0) : ((_local_3 - 0.5) >> 0));
                };
            }
            else
            {
                while (--_local_4 > -1)
                {
                    _local_2 = this._info[_local_4];
                    this._a[_local_2.i] = ((_local_2.c * _arg_1) + _local_2.s);
                };
            };
        }

        override public function _onInitTween(_arg_1:Object, _arg_2:*, _arg_3:TweenLite):Boolean
        {
            if (((!(_arg_1 is Array)) || (!(_arg_2 is Array))))
            {
                return (false);
            };
            this._init((_arg_1 as Array), _arg_2);
            return (true);
        }


    }
}//package com.greensock.plugins

class ArrayTweenInfo 
{

    public var s:Number;
    public var i:uint;
    public var c:Number;

    public function ArrayTweenInfo(_arg_1:uint, _arg_2:Number, _arg_3:Number)
    {
        this.i = _arg_1;
        this.s = _arg_2;
        this.c = _arg_3;
    }

}

