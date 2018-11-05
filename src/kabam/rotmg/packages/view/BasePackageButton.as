﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//kabam.rotmg.packages.view.BasePackageButton

package kabam.rotmg.packages.view
{
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import com.company.util.AssetLibrary;
    import flash.display.BitmapData;
    import com.company.assembleegameclient.util.TextureRedrawer;
    import com.company.util.BitmapUtil;
    import flash.display.Bitmap;
    import flash.geom.Rectangle;
    import kabam.rotmg.text.view.TextFieldDisplayConcrete;

    public class BasePackageButton extends Sprite 
    {

        public static const IMAGE_NAME:String = "redLootBag";
        public static const IMAGE_ID:int = 0;


        protected static function makeIcon():DisplayObject
        {
            var _local_2:DisplayObject;
            var _local_1:BitmapData = AssetLibrary.getImageFromSet(IMAGE_NAME, IMAGE_ID);
            _local_1 = TextureRedrawer.redraw(_local_1, 40, true, 0);
            _local_1 = BitmapUtil.cropToBitmapData(_local_1, 10, 10, (_local_1.width - 20), (_local_1.height - 20));
            _local_2 = new Bitmap(_local_1);
            _local_2.x = 3;
            _local_2.y = 3;
            return (_local_2);
        }


        protected function positionText(_arg_1:DisplayObject, _arg_2:TextFieldDisplayConcrete):void
        {
            var _local_3:Number;
            var _local_4:Rectangle = _arg_1.getBounds(this);
            _local_3 = (_local_4.top + (_local_4.height / 2));
            _arg_2.x = _local_4.right;
            _arg_2.y = (_local_3 - (_arg_2.height / 2));
        }


    }
}//package kabam.rotmg.packages.view

