﻿// Decompiled by AS3 Sorcerer 5.96
// www.as3sorcerer.com

//kabam.rotmg.core.commands.ConfigurePaymentsWindowCommand

package kabam.rotmg.core.commands
{
    import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
    import kabam.rotmg.account.core.Account;
    import kabam.rotmg.account.core.signals.OpenMoneyWindowSignal;
    import kabam.rotmg.account.core.commands.ExternalOpenMoneyWindowCommand;
    import kabam.rotmg.account.core.commands.InternalOpenMoneyWindowCommand;
    import kabam.rotmg.account.web.WebAccount;
    import kabam.rotmg.account.kabam.KabamAccount;

    public class ConfigurePaymentsWindowCommand 
    {

        [Inject]
        public var commandMap:ISignalCommandMap;
        [Inject]
        public var account:Account;
        [Inject]
        public var data:XML;


        public function execute():void
        {
            this.commandMap.map(OpenMoneyWindowSignal).toCommand(this.getPaymentsCommandClass());
        }

        private function getPaymentsCommandClass():Class
        {
            return ((this.useExternalPaymentsWindow()) ? ExternalOpenMoneyWindowCommand : InternalOpenMoneyWindowCommand);
        }

        private function useExternalPaymentsWindow():Boolean
        {
            return ((((this.account is KabamAccount) || (this.account is WebAccount)) && (this.data["UseExternalPayments"] == null)) || (Boolean(int(this.data["UseExternalPayments"]))));
        }


    }
}//package kabam.rotmg.core.commands

