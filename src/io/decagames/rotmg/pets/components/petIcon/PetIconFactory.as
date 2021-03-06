﻿


//io.decagames.rotmg.pets.components.petIcon.PetIconFactory

package io.decagames.rotmg.pets.components.petIcon
{
	import com.company.assembleegameclient.util.TextureRedrawer;
	import com.company.assembleegameclient.util.redrawers.GlowRedrawer;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import io.decagames.rotmg.pets.data.vo.IPetVO;
	import io.decagames.rotmg.pets.data.vo.PetVO;
	
	public class PetIconFactory
	{
		
		public var outlineSize:Number = 1.4;
		
		public function create(_arg_1:PetVO, _arg_2:int):PetIcon
		{
			var _local_3:BitmapData = this.getPetSkinTexture(_arg_1, _arg_2);
			var _local_4:Bitmap = new Bitmap(_local_3);
			var _local_5:PetIcon = new PetIcon(_arg_1);
			_local_5.setBitmap(_local_4);
			return (_local_5);
		}
		
		public function getPetSkinTexture(_arg_1:IPetVO, _arg_2:int, _arg_3:uint = 0):BitmapData
		{
			var _local_4:Number;
			var _local_5:BitmapData;
			var _local_6:BitmapData = ((_arg_1.getSkinMaskedImage()) ? _arg_1.getSkinMaskedImage().image_ : null);
			if (_local_6)
			{
				_local_4 = (5 * (16 / _local_6.width));
				_local_5 = TextureRedrawer.resize(_local_6, _arg_1.getSkinMaskedImage().mask_, _arg_2, true, 0, 0, _local_4);
				_local_5 = GlowRedrawer.outlineGlow(_local_5, _arg_3, this.outlineSize);
				return (_local_5);
			}
			;
			return (new BitmapDataSpy(_arg_2, _arg_2));
		}
	
	}
}//package io.decagames.rotmg.pets.components.petIcon

