import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0xf6)
namespace Netx3f6 {
  // ,NETX3,myVaillant VR940f WiFi gateway (address f6),0130,0404

  @ext(0xff, 0xfe)
  model GatewayConfigStub is ReadonlyRegister<UCH>;
}
