package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_979:SoundChannel = null;
      
      private var var_812:Boolean;
      
      private var var_980:Sound = null;
      
      private var var_744:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_980 = param1;
         var_980.addEventListener(Event.COMPLETE,onComplete);
         var_744 = 1;
         var_812 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_812;
      }
      
      public function stop() : Boolean
      {
         var_979.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_812 = false;
         var_979 = var_980.play(0);
         this.volume = var_744;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_744;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_979.position;
      }
      
      public function get length() : Number
      {
         return var_980.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_744 = param1;
         if(var_979 != null)
         {
            var_979.soundTransform = new SoundTransform(var_744);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_812 = true;
      }
   }
}
