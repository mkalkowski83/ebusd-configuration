import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Ctlx0 {
  // ,CTLX0,myVaillant connect / VRT51f (eBUS),0130,0404
  // Product Scan.Id 0020292012. No periodic telegrams on the bus in grab tests;
  // room/setpoint data for VRT51f is via RF / myVaillant, not direct eBUS polls.
  // Use: ebusctl read Scan.15 Id  |  scan.15

  /** Internal: keeps a valid config file; not used for polling (do not read). */
  @ext(0xff, 0xfe)
  model GatewayConfigStub is ReadonlyRegister<UCH>;
}
