package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1359:BigInteger;
      
      private var var_581:BigInteger;
      
      private var var_1605:BigInteger;
      
      private var var_1606:BigInteger;
      
      private var var_2247:BigInteger;
      
      private var var_2108:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1359 = param1;
         var_1605 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2247.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1606 = new BigInteger();
         var_1606.fromRadix(param1,param2);
         var_2247 = var_1606.modPow(var_581,var_1359);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2108.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1359.toString() + ",generator: " + var_1605.toString() + ",secret: " + param1);
         var_581 = new BigInteger();
         var_581.fromRadix(param1,param2);
         var_2108 = var_1605.modPow(var_581,var_1359);
         return true;
      }
   }
}
