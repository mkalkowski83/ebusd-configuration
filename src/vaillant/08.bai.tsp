import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./scan.tsp";
import "./bai.0010002315_inc.tsp";
import "./bai.0010002465_inc.tsp";
import "./bai.0010003857_inc.tsp";
import "./bai.0010003886_inc.tsp";
import "./bai.0010004121_inc.tsp";
import "./bai.0010004150_inc.tsp";
import "./bai.0010005400_inc.tsp";
import "./bai.0010006101_inc.tsp";
import "./bai.0010006341_inc.tsp";
import "./bai.0010007508_inc.tsp";
import "./bai.0010010674_inc.tsp";
import "./bai.0010011701_inc.tsp";
import "./bai.0010015600_inc.tsp";
import "./bai.0020066007_inc.tsp";
import "./bai.308523_inc.tsp";
import "./bai.0010021901_inc.tsp";
import "./bai.0010021961_inc.tsp";
import "./bai.0010008045_inc.tsp";
import "./bai.0010024646_inc.tsp";
import "./hcmode_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Bai {
  // ,BAI00,generic file for all BAI types
  // fallbacks:

  /** included parts */
  union _includes {
    @condition(Scan.Id.product, "='0010024646'")
    Scan_Id_product_0010024646: Bai._0010024646_inc,

    @condition(Scan.Id.product, "='0010002315'", "'0010002316'", "'0010002317'")
    Scan_Id_product_0010002315: Bai._0010002315_inc,

    @condition(
      Scan.Id.product,
      "='0010003958'",
      "'0010002465'",
      "'0010003959'",
      "'0010003960'",
      "'0010003961'",
      "'0010003962'",
      "'0010003963'",
      "'0010003964'",
      "'0010003965'",
      "'0010003966'",
      "'0010003967'",
      "'0010003968'",
      "'0010003969'",
      "'0010003970'",
      "'0010003971'",
      "'0010003972'",
      "'0010003973'",
      "'0010003974'",
      "'0010003975'",
      "'0010003976'",
      "'0010003977'",
      "'0010003991'",
      "'0010004015'",
      "'0010004016'"
    )
    Scan_Id_product_0010002465: Bai._0010002465_inc,

    @condition(
      Scan.Id.product,
      "='0010003857'",
      "'0010003858'",
      "'0010003860'",
      "'0010003861'",
      "'0010003862'",
      "'0010003863'",
      "'0010003864'",
      "'0010003865'",
      "'0010003869'",
      "'0010003872'",
      "'0010003874'",
      "'0010003875'",
      "'0010003876'",
      "'0010003877'",
      "'0010003878'",
      "'0010003881'",
      "'0010009340'",
      "'0010009341'",
      "'0010009342'",
      "'0010009343'",
      "'0010009344'",
      "'0010009345'",
      "'0010009346'",
      "'0010009347'",
      "'0010009348'",
      "'0010009349'",
      "'0010009350'"
    )
    Scan_Id_product_0010003857: Bai._0010003857_inc,

    @condition(
      Scan.Id.product,
      "='0010003882'",
      "'0010003883'",
      "'0010003886'",
      "'0010003887'",
      "'0010009351'",
      "'0010009352'",
      "'167'"
    )
    Scan_Id_product_0010003886: Bai._0010003886_inc,

    @condition(
      Scan.Id.product,
      "='0010004110'",
      "'0010004111'",
      "'0010004112'",
      "'0010004113'",
      "'0010004114'",
      "'0010004121'",
      "'0010004122'",
      "'0010004123'",
      "'0010004124'",
      "'0010004125'",
      "'0010002498'",
      "'209'"
    )
    Scan_Id_product_0010004121: Bai._0010004121_inc,

    @condition(Scan.Id.product, "='0010004126'", "'0010004127'", "'0010010384'")
    Scan_Id_product_0010004150: Bai._0010004150_inc,

    @condition(
      Scan.Id.product,
      "='0010005400'",
      "'0010005401'",
      "'0010005402'",
      "'0010005403'",
      "'0010005404'",
      "'0010005405'",
      "'0010005406'",
      "'0010005407'",
      "'0010005408'",
      "'0010005409'"
    )
    Scan_Id_product_0010005400: Bai._0010005400_inc,

    @condition(
      Scan.Id.product,
      "='0010006080'",
      "'0010006081'",
      "'0010006082'",
      "'0010006083'",
      "'0010006084'",
      "'0010006085'",
      "'0010006086'",
      "'0010006087'",
      "'0010006088'",
      "'0010006089'",
      "'0010006090'",
      "'0010006091'",
      "'0010006092'",
      "'0010006093'",
      "'0010006094'",
      "'0010006095'",
      "'0010006096'",
      "'0010006097'",
      "'0010006098'",
      "'0010006099'",
      "'0010006100'",
      "'0010006101'",
      "'0010006102'",
      "'0010006103'",
      "'0010006104'",
      "'0010006105'",
      "'0010006106'",
      "'0010006107'",
      "'0010006108'",
      "'0010006109'",
      "'0010006110'",
      "'0010006111'",
      "'0010006112'",
      "'0010006113'",
      "'0010006114'",
      "'0010006115'",
      "'0010006118'",
      "'0010006119'",
      "'0010006120'",
      "'0010006121'",
      "'0010006122'",
      "'0010006123'",
      "'0010006126'",
      "'0010006127'",
      "'0010006129'",
      "'0010006130'",
      "'0010006131'",
      "'0010006134'",
      "'0010006135'",
      "'0010006136'",
      "'0010006137'",
      "'0010006138'",
      "'0010006139'",
      "'0010006140'",
      "'0010006141'",
      "'188'",
      "'BAI__'",
      "''"
    )
    Scan_Id_product_0010006101: Bai._0010006101_inc,

    @condition(Scan.Id.product, "='0010006341'")
    Scan_Id_product_0010006341: Bai._0010006341_inc,

    @condition(
      Scan.Id.product,
      "='0010007508'",
      "'0010007510'",
      "'0010007512'",
      "'0010007514'",
      "'0010007516'",
      "'0010007518'",
      "'0010007520'",
      "'0010007522'",
      "'0010007524'",
      "'0010007526'",
      "'0010007688'",
      "'0010007692'",
      "'0010007696'",
      "'0010007700'",
      "'0010007704'"
    )
    Scan_Id_product_0010007508: Bai._0010007508_inc,

    @condition(
      Scan.Id.product,
      "='0010010674'",
      "'0010010676'",
      "'0010010678'",
      "'207'"
    )
    Scan_Id_product_0010010674: Bai._0010010674_inc,

    @condition(
      Scan.Id.product,
      "='0010011701'",
      "'0010011702'",
      "'0010011703'",
      "'0010011704'",
      "'0010011709'",
      "'0010016402'",
      "'0010016403'"
    )
    Scan_Id_product_0010011701: Bai._0010011701_inc,

    @condition(
      Scan.Id.product,
      "='0010014917'",
      "'0010014629'",
      "'0010014630'",
      "'0010014631'",
      "'0010014632'",
      "'0010014633'",
      "'0010015596'",
      "'0010015597'",
      "'0010015598'",
      "'0010015599'",
      "'0010015600'",
      "'0010015601'",
      "'0010015602'",
      "'0010015603'",
      "'0010015604'",
      "'0010015605'",
      "'0010015606'",
      "'0010015607'",
      "'0010015608'",
      "'0010015609'",
      "'0010015610'",
      "'0010015611'",
      "'0010015612'",
      "'0010015613'",
      "'0010015614'",
      "'0010019268'",
      "'0010019276'",
      "'0010021875'",
      "'0010021887'",
      "'0010021888'",
      "'0010021891'",
      "'0010021929'"
    )
    Scan_Id_product_0010015600: Bai._0010015600_inc,

    @condition(Scan.Id.product, "='0020066007'", "'187'")
    Scan_Id_product_0020066007: Bai._0020066007_inc,

    @condition(
      Scan.Id.product,
      "='0010004276'",
      "'0010004277'",
      "'0010004279'",
      "'0010004280'",
      "'0010004281'",
      "'0010004282'",
      "'0010004283'",
      "'0010004285'",
      "'0010004286'",
      "'0010004288'",
      "'0010004289'",
      "'0010004290'",
      "'0010004291'",
      "'0010004292'",
      "'0010004336'",
      "'0010004337'",
      "'0010004338'",
      "'0010004339'",
      "'0010004340'",
      "'0010005466'",
      "'0010005467'",
      "'0010005468'",
      "'0010005469'",
      "'0010010392'",
      "'0010010393'",
      "'0010010394'",
      "'0010010400'",
      "'0020051714'",
      "'0020051715'",
      "'0020051716'",
      "'0020051717'",
      "'174'"
    )
    Scan_Id_product_308523: Bai._308523_inc,

    @condition(Scan.Id.product, "='0010021901'")
    Scan_Id_product_0010021901: Bai._0010021901_inc,

    @condition(
      Scan.Id.product,
      "='0010021961'",
      "'0010021962'",
      "'0010021963'",
      "'0010021964'",
      "'0010021965'",
      "'0010021966'",
      "'0010021967'"
    )
    Scan_Id_product_0010021961: Bai._0010021961_inc,

    @condition(Scan.Id.product, "='0010008045'", "'0010008863'", "'0010023648'")
    Scan_Id_product_0010008045: Bai._0010008045_inc,

    @condition(Id.Id.hw, "=6701")
    hw_6701: Bai._0010003886_inc,

    @condition(Id.Id.hw, "=0902")
    hw_0902: Bai._0010004121_inc,

    @condition(Id.Id.hw, "=8801")
    hw_8801: Bai._0010006101_inc,

    @condition(Id.Id.hw, "=0702")
    hw_0702: Bai._0010010674_inc,

    @condition(Id.Id.hw, "=5502")
    hw_5502: Bai._0010011701_inc,

    @condition(Id.Id.hw, "=9602")
    hw_9602: Bai._0010015600_inc,

    @condition(Id.Id.hw, "=8701")
    hw_8701: Bai._0020066007_inc,

    @condition(Id.Id.hw, "=7401")
    hw_7401: Bai._308523_inc,

    @condition(Id.Id.hw, "=3302")
    hw_3302: Bai._0010021901_inc,

    @condition(Id.Id.hw, "=7803")
    hw_7803: Bai._0010021961_inc,

    @condition(Id.Id.hw, "=4702")
    hw_4702: Bai._0010008045_inc,

    default: Bai._308523_inc, // final load alternative
    Hcmode_inc,
  }
}
