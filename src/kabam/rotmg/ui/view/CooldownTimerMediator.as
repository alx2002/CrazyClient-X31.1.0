﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//kabam.rotmg.ui.view.CooldownTimerMediator

package kabam.rotmg.ui.view
{
    import robotlegs.bender.bundles.mvcs.Mediator;
    import kabam.rotmg.ui.model.HUDModel;
    import kabam.rotmg.ui.signals.UpdateHUDSignal;
    import com.company.assembleegameclient.objects.Player;

    public class CooldownTimerMediator extends Mediator 
    {

        [Inject]
        public var view:CooldownTimer;
        [Inject]
        public var hudModel:HUDModel;
        [Inject]
        public var updateHUD:UpdateHUDSignal;


        override public function initialize():void
        {
            this.updateHUD.add(this.onUpdateHUD);
        }

        override public function destroy():void
        {
            this.updateHUD.add(this.onUpdateHUD);
        }

        private function onUpdateHUD(_arg_1:Player):void
        {
            this.view.update(_arg_1);
        }


    }
}//package kabam.rotmg.ui.view

