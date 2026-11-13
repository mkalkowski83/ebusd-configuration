import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x04)
namespace Netx3 {
  // ,NETX3,myVaillant VR940f WiFi gateway,0130,0404
  // Same product id 0020292012 as CTLX0; eBUS role is connectivity, not room control.

  @ext(0xff, 0xfe)
  model GatewayConfigStub is ReadonlyRegister<UCH>;
}
