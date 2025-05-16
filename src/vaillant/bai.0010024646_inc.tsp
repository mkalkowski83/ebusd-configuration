import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010024646_inc {
  // ,BAI00,Vaillant ecoTEC,0010024646

  /** Statenumber_DK: status number */
  @ext(0xab, 0x00)
  model Statenumber is ReadonlyRegister<UCH>;

  /** d.00 heating partload: Heating part load */
  @ext(0x07, 0x04)
  model PartloadHcKW is InstallRegister<power>;

  /** d.01 central heating overruntime: water pump overrun time for heating mode */
  @ext(0xf7, 0x03)
  model WPPostrunTime is InstallRegister<minutes0>;

  /** d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint */
  @ext(0x09, 0x04)
  model BlockTimeHcMax is InstallRegister<minutes0>;

  /** d.03 Temp DHW: hot water flow temperature (combination boiler only) */
  @ext(0x16, 0x00)
  model HwcTemp is ReadonlyRegister<tempsensor>;

  /** d.04 Temp storage / she: current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only) */
  @ext(0x17, 0x00)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.05 flow/return setpoint: Flow temperature target value or return target value when return regulation is set */
  @ext(0x39, 0x00)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** d.07 Storage setpoint: Warm start temperature value (combination boiler plus only), Storage temperature target value (system boiler only) */
  @ext(0x04, 0x00)
  model StorageTempDesired is ReadonlyRegister<temp>;

  /** d.08 Room thermostat 230 V: External controls heat demand (Clamp 3-4) */
  @ext(0x2a, 0x00)
  model ACRoomthermostat is ReadonlyRegister<onoff>;

  /** d.09 ext flowsetpoint: minimum out of Kl.7 and eBus flow setpoint */
  @ext(0x6e, 0x04)
  model ExtFlowTempDesiredMin is ReadonlyRegister<temp>;

  /** d.10 Central heating pump: internal heating pump */
  @ext(0x44, 0x00)
  model WP is ReadonlyRegister<onoff>;

  /** d.11 external pump: External heating pump */
  @ext(0x3f, 0x00)
  model ExtWP is ReadonlyRegister<onoff>;

  /** d.12 storage load pump: tank load pump demand */
  @ext(0x9e, 0x00)
  model Storageloadpump is ReadonlyRegister<percent0>;

  /** d.13 Circulation pump: Hot water circulation pump (via external module) */
  @ext(0x7b, 0x00)
  model CirPump is ReadonlyRegister<onoff>;

  /** d.22 DHW demand: domestic hot water (tapping or tank contact) demand */
  @ext(0x58, 0x00)
  model HwcDemand is ReadonlyRegister<yesno>;

  /** d.23 operation mode: Wintermode active */
  @ext(0xf2, 0x03)
  model HeatingSwitch is ReadonlyRegister<onoff>;

  /** d.25 DHW demand enabled: hot water release (tank storage) via eBus Control */
  @ext(0x47, 0x04)
  model StoragereleaseClock is ReadonlyRegister<yesno>;

  /** d.30 Gasvalve: Gasvalve activation signal */
  @ext(0xbb, 0x00)
  model Gasvalve is ReadonlyRegister<onoff2>;

  /** d.33 Target fan speed */
  @inherit(r)
  @ext(0x24, 0x00)
  model TargetFanSpeed {
    /** Fan speed setpoint */
    @unit("1/min")
    value: UIN;
  }

  /** d.34 Actual fan speed */
  @inherit(r)
  @ext(0x83, 0x00)
  model FanSpeed {
    /** fan speed actual value */
    @unit("1/min")
    value: UIN;
  }

  /** d.35 Position TWV: Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
  @ext(0x54, 0x00)
  model PositionValveSet is ReadonlyRegister<UCH>;

  /** d.40 TFT_DK: flow temperature */
  @ext(0x18, 0x00)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** d.41 Temp heating return: return temperature */
  @ext(0x98, 0x00)
  model ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.44 Dig. ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0x00)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.47 Temp outside: Outside temperature (uncorrected value) */
  @ext(0x76, 0x00)
  model OutdoorstempSensor is ReadonlyRegister<tempsensor>;

  /** d.60 Number STL cut off: Number of safety temperature limiter cut offs */
  @ext(0x20, 0x00)
  model DeactivationsTemplimiter is ReadonlyRegister<UCH>;

  /** d.61 Number ignition device cut off: number of lock outs (unsuccessfull ignitons in the last attempt, flame failure) */
  @ext(0x1f, 0x00)
  model DeactivationsIFC is ReadonlyRegister<UCH>;

  /** d.64 average ignition time */
  @inherit(r)
  @ext(0x2d, 0x00)
  model AverageIgnitiontime {
    /** average ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.65 Max ignition time */
  @inherit(r)
  @ext(0x2c, 0x00)
  model MaxIgnitiontime {
    /** maximum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0x00)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.68 ignition attempts 1: unsuccessfull ignitions in the first attempt */
  @ext(0x6e, 0x00)
  model CounterStartattempts1 is ReadonlyRegister<temp0>;

  /** d.69 ignition attempts 2: unsuccessfull ignitions in the second attempt */
  @ext(0x6f, 0x00)
  model CounterStartattempts2 is ReadonlyRegister<temp0>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0x00, 0x04)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** Flame */
  @ext(0x05, 0x00)
  model Flame is ReadonlyRegister<onoff2>;

  /** Fan operation hours */
  @ext(0x1b, 0x00)
  model FanHours is ReadonlyRegister<hoursum2>;

  /** FanCommunt_DK: commutations of the fan */
  @ext(0x1c, 0x00)
  model FanStarts is ReadonlyRegister<cntstarts2>;

  /** CounterStartAttempts3_DK: unsuccessfull ignitions in the third attempt */
  @ext(0x81, 0x00)
  model CounterStartAttempts3 is ReadonlyRegister<temp0>;

  /** CounterStartAttempts4_DK: unsuccessfull ignitions in the fourth attempt */
  @ext(0x82, 0x00)
  model CounterStartAttempts4 is ReadonlyRegister<temp0>;

  /** TempDiffBlock_DK: Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
  @ext(0x12, 0x00)
  model TempDiffBlock is ReadonlyRegister<temp0>;

  /** TempDiffFailure_DK: Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures */
  @ext(0x13, 0x00)
  model TempDiffFailure is ReadonlyRegister<temp0>;

  /** TWV_Communt_DK: commutations of the three way valve */
  @ext(0x1a, 0x00)
  model ValveStarts is ReadonlyRegister<cntstarts2>;

  /** TemplimiterWithNTC: Safety temperature limit concept */
  @ext(0xd2, 0x00)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** HcHours: Central heating operation hours */
  @ext(0x38, 0x01)
  model HcHours is ReadonlyRegister<hoursum>;

  /** HcPumpStarts: Central heating pump starts */
  @ext(0x56, 0x03)
  model HcPumpStarts is ReadonlyRegister<UCH>;

  /** HcStarts: Central heating burner starts */
  @ext(0x38, 0x03)
  model HcStarts is ReadonlyRegister<UCH>;

  /** HwcHours: Hot water operation hours */
  @ext(0x77, 0x01)
  model HwcHours is ReadonlyRegister<hoursum>;

  /** HwcStarts: Hot water burner starts */
  @ext(0x77, 0x03)
  model HwcStarts is ReadonlyRegister<cntstarts2>;

  /** PumpHours: Pump operation hours */
  @ext(0x14, 0x00)
  model PumpHours is ReadonlyRegister<BCD>;
  
  /** StorageLoadPumpHours: Storage load pump operation hours */
  @ext(0x73, 0x01)
  model StorageLoadPumpHours is ReadonlyRegister<hoursum>;

  /** StorageloadPumpStarts: Storage load pump starts */
  @ext(0x73, 0x03)
  model StorageloadPumpStarts is ReadonlyRegister<cntstarts2>;

  /** Valve mode */
  @ext(0xf4, 0x03)
  model ValveMode is ReadonlyRegister<UCH>;

  /** HcPumpMode: Heating pump mode */
  @ext(0x4e, 0x04)
  model HcPumpMode is ReadonlyRegister<UCH>;

  /** Dodane parametry na podstawie wyników komendy grab */

  /** DisplayMode: Display operation mode */
  @ext(0xda, 0x00)
  model DisplayMode is ReadonlyRegister<UCH>;

  /** WaterpressureMeasureCounter: Water pressure measurement counter */
  @ext(0xf1, 0x00)
  model WaterpressureMeasureCounter is ReadonlyRegister<UCH>;

  /** HwcUnderHundredStarts: Hot water starts under hundred counter */
  @ext(0x31, 0x00)
  model HwcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** HcUnderHundredStarts: Heating starts under hundred counter */
  @ext(0x30, 0x00)
  model HcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** SHEMaxFlowTemp: Secondary heat exchanger maximum flow temperature */
  @ext(0xc3, 0x00)
  model SHEMaxFlowTemp is ReadonlyRegister<temp>;

  /** HwcTempMax: Maximum hot water temperature */
  @ext(0x43, 0x04)
  model HwcTempMax is ReadonlyRegister<Ebus.Num.D2C>;
  
  /** Maintenancedata_HwcTempMax: Maximum hot water temperature from maintenance data */
  @ext(0x35, 0x00)
  model Maintenancedata_HwcTempMax is ReadonlyRegister<temp>;

  /** StorageTempMax: Maximum storage temperature */
  @ext(0x36, 0x00)
  model StorageTempMax is ReadonlyRegister<temp>;

  /** FlowTempMax: Maximum flow temperature */
  @ext(0x37, 0x00)
  model FlowTempMax is ReadonlyRegister<temp>;

  /** ReturnTempMax: Maximum return temperature */
  @ext(0xbe, 0x00)
  model ReturnTempMax is ReadonlyRegister<temp>;

  /** ModulationTempDesired: Desired modulation temperature */
  @ext(0x2e, 0x00)
  model ModulationTempDesired is ReadonlyRegister<temp>;

  /** PumpPower: Pump power value */
  @ext(0x73, 0x00)
  model PumpPower is ReadonlyRegister<UCH>;

  /** PumpPowerDesired: Desired pump power */
  @ext(0xa1, 0x00)
  model PumpPowerDesired {
    @unit("%")
    value: UCH;
  }

  /** HwcWaterflow: Hot water flow rate */
  @ext(0x55, 0x00)
  model HwcWaterflow is ReadonlyRegister<uin100>;

  /** HwcWaterflowMax: Maximum hot water flow rate */
  @ext(0x56, 0x00)
  model HwcWaterflowMax is ReadonlyRegister<uin100>;

  /** HwcImpellorSwitch: Hot water impellor switch */
  @ext(0x57, 0x00)
  model HwcImpellorSwitch is ReadonlyRegister<yesno>;

  /** VortexFlowSensor: Vortex flow sensor value */
  @ext(0xd5, 0x00)
  model VortexFlowSensor is ReadonlyRegister<UIN>;

  /** OverflowCounter: Overflow counter */
  @ext(0x1e, 0x00)
  model OverflowCounter is ReadonlyRegister<yesno>;

  /** SecondPumpMode: Second pump mode */
  @ext(0x0b, 0x04)
  model SecondPumpMode is ReadonlyRegister<UCH>;

  /** ExternalHwcSwitch: External hot water circuit switch */
  @ext(0x00, 0x00)
  model ExternalHwcSwitch is ReadonlyRegister<onoff>;

  /** HwcTempDesired: Hot water temperature desired value */
  @ext(0xea, 0x03)
  model HwcTempDesired is ReadonlyRegister<temp>;

  /** WarmstartDemand: Warm start demand */
  @ext(0x3a, 0x04)
  model WarmstartDemand is ReadonlyRegister<onoff>;

  /** Templimiter: Temperature limiter status */
  @ext(0x77, 0x00)
  model Templimiter is ReadonlyRegister<onoff>;

  /** HoursTillService: Hours till next service */
  @ext(0x20, 0x04)
  model HoursTillService is ReadonlyRegister<ULG>;

  /** TimerInputHc: Timer input for heating circuit */
  @ext(0xde, 0x00)
  model TimerInputHc is ReadonlyRegister<onoff>;

  /** PrEnergySumHwc1: Energy sum hot water circuit 1 */
  @ext(0x03, 0xc5)
  model PrEnergySumHwc1 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHwc1: Energy count hot water circuit 1 */
  @ext(0x03, 0xc6)
  model PrEnergyCountHwc1 is ReadonlyRegister<UIN>;

  /** PrEnergySumHwc2: Energy sum hot water circuit 2 */
  @ext(0x03, 0xc7)
  model PrEnergySumHwc2 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHwc2: Energy count hot water circuit 2 */
  @ext(0x03, 0xc8)
  model PrEnergyCountHwc2 is ReadonlyRegister<UIN>;

  /** PrEnergySumHwc3: Energy sum hot water circuit 3 */
  @ext(0x03, 0xc9)
  model PrEnergySumHwc3 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHwc3: Energy count hot water circuit 3 */
  @ext(0x03, 0xca)
  model PrEnergyCountHwc3 is ReadonlyRegister<UIN>;

  /** PrEnergySumHc1: Energy sum heating circuit 1 */
  @ext(0x03, 0xf5)
  model PrEnergySumHc1 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHc1: Energy count heating circuit 1 */
  @ext(0x03, 0xf6)
  model PrEnergyCountHc1 is ReadonlyRegister<UIN>;

  /** PrEnergySumHc2: Energy sum heating circuit 2 */
  @ext(0x03, 0xf7)
  model PrEnergySumHc2 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHc2: Energy count heating circuit 2 */
  @ext(0x03, 0xf8)
  model PrEnergyCountHc2 is ReadonlyRegister<UIN>;

  /** PrEnergySumHc3: Energy sum heating circuit 3 */
  @ext(0x03, 0xf9)
  model PrEnergySumHc3 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHc3: Energy count heating circuit 3 */
  @ext(0x03, 0xfa)
  model PrEnergyCountHc3 is ReadonlyRegister<UIN>;

  /** PumpHwcFlowSum: Pump hot water flow sum */
  @ext(0xc1, 0x00)
  model PumpHwcFlowSum is ReadonlyRegister<UIN>;

  /** PumpHwcFlowNumber: Pump hot water flow number */
  @ext(0xc2, 0x00)
  model PumpHwcFlowNumber is ReadonlyRegister<UIN>;

  /** PrAPSCounter: APS counter */
  @ext(0xf2, 0x00)
  model PrAPSCounter is ReadonlyRegister<UCH>;

  /** PrVortexFlowSensorValue: Vortex flow sensor value (legacy name) */
  @ext(0xf4, 0x00)
  model PrVortexFlowSensorValue is ReadonlyRegister<UIN>;

  /** HwcPostrunTime: Hot water pump overrun time */
  @ext(0x11, 0x04)
  model HwcPostrunTime is ReadonlyRegister<minutes0>;

  /** ChangesDSN: Numbers adjusting (storing) the DSN */
  @ext(0x0c, 0x00)
  model ChangesDSN is ReadonlyRegister<UCH>;


  /** ExternalFlowTempDesired: External flow temperature desired */
  @ext(0x25, 0x00)
  model ExternalFlowTempDesired is ReadonlyRegister<Ebus.Num.D2C>;

  /** TempMaxDiffExtTFT: Maximum temperature difference */
  @ext(0x27, 0x00)
  model TempMaxDiffExtTFT is ReadonlyRegister<temp>;

  /** Expertlevel_ReturnTemp: Return temperature expert level */
  @ext(0x6b, 0x00)
  model Expertlevel_ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** PowerValue: Power value of the boiler */
  @inherit(r)
  @ext(0xaa, 0x00)
  model PowerValue {
      /** Power value of the boiler (minimum and maximum) */
      @maxLength(6)
      value: HEX;
  }

  /** TempGradientFailure: Number of cut offs of the boilers cause of to high gradient (S.54) */
  @ext(0x11, 0x00)
  model TempGradientFailure is ReadonlyRegister<temp0>;

  /** included parts */
  union _includes {
    Errors_inc,
    Service_inc,
  }
}

