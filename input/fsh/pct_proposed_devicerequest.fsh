Profile: PCTProposedDeviceRequest
Parent: DeviceRequest
Id: davinci-pct-proposed-devicerequest
Title: "PCT GFE Proposed DeviceRequest"
Description: "The PCT Proposed DeviceRequest including details about a device for which a GFE is being requested."

* status = #active
* intent = #proposal

* code[x] 1..1 MS

* subject only Reference(HRexPatientDemographics)
