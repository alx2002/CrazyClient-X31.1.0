﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//com.company.assembleegameclient.util.ParameterizedHandlerContainer

package com.company.assembleegameclient.util
{
    import flash.utils.Dictionary;
    import flash.events.IEventDispatcher;
    import flash.events.Event;

    public class ParameterizedHandlerContainer 
    {

        public var _handlers:Dictionary;

        public function ParameterizedHandlerContainer()
        {
            this._handlers = new Dictionary(true);
        }

        public function registerHandler(_arg_1:IEventDispatcher, _arg_2:String, _arg_3:Function, ... _args):Function
        {
            var dispatcher:IEventDispatcher;
            var eventType:String;
            var callback:Function;
            var args:Array;
            var f:Function;
            var arg1:IEventDispatcher = _arg_1;
            var arg2:String = _arg_2;
            var arg3:Function = _arg_3;
            var rest:Array = _args;
            var loc1:* = undefined;
            dispatcher = arg1;
            eventType = arg2;
            callback = arg3;
            args = rest;
            f = function (_arg_1:Event):void
            {
                args.unshift(_arg_1);
                callback.apply(null, args);
            };
            this._handlers[callback] = new HandlerConfig(f, dispatcher);
            dispatcher.addEventListener(eventType, f);
            return (f);
        }

        public function destroyHandler(_arg_1:Function, _arg_2:Event):void
        {
            var _local_3:* = this._handlers[_arg_1];
            if (_local_3)
            {
                _local_3.dispatcher.removeEventListener(_arg_2.type, _local_3.handler);
                delete this._handlers[_arg_1];
            };
        }


    }
}//package com.company.assembleegameclient.util

import flash.events.IEventDispatcher;

class HandlerConfig 
{

    public var handler:Function;
    public var dispatcher:IEventDispatcher;

    public function HandlerConfig(_arg_1:Function, _arg_2:IEventDispatcher)
    {
        this.handler = _arg_1;
        this.dispatcher = _arg_2;
    }

}

