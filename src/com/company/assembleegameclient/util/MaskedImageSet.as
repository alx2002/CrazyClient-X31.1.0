﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//com.company.assembleegameclient.util.MaskedImageSet

package com.company.assembleegameclient.util
{
    import __AS3__.vec.Vector;
    import com.company.util.ImageSet;
    import flash.display.BitmapData;
    import __AS3__.vec.*;

    public class MaskedImageSet 
    {

        public var images_:Vector.<MaskedImage> = new Vector.<MaskedImage>();


        public function addFromBitmapData(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:int, _arg_4:int):void
        {
            var _local_5:ImageSet;
            var _local_6:int;
            var _local_7:ImageSet = new ImageSet();
            _local_7.addFromBitmapData(_arg_1, _arg_3, _arg_4);
            if (_arg_2 != null)
            {
                _local_5 = new ImageSet();
                _local_5.addFromBitmapData(_arg_2, _arg_3, _arg_4);
                if (_local_7.images_.length > _local_7.images_.length)
                {
                };
            };
            while (_local_6 < _local_7.images_.length)
            {
                this.images_.push(new MaskedImage(_local_7.images_[_local_6], ((_local_5 == null) ? null : ((_local_6 >= _local_5.images_.length) ? null : _local_5.images_[_local_6]))));
                _local_6++;
            };
        }

        public function addFromMaskedImage(_arg_1:MaskedImage, _arg_2:int, _arg_3:int):void
        {
            this.addFromBitmapData(_arg_1.image_, _arg_1.mask_, _arg_2, _arg_3);
        }


    }
}//package com.company.assembleegameclient.util

