﻿


//kabam.rotmg.core.signals.TaskErrorSignal

package kabam.rotmg.core.signals
{
    import org.osflash.signals.Signal;
    import kabam.lib.tasks.Task;

    public class TaskErrorSignal extends Signal 
    {

        public function TaskErrorSignal()
        {
            super(Task);
        }

    }
}//package kabam.rotmg.core.signals

