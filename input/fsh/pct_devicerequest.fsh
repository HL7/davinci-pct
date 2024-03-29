Profile: PCTDeviceRequest
Parent: DeviceRequest
Id: davinci-pct-devicerequest
Title: "PCT GFE DeviceRequest"
Description: "The PCT DeviceRequest including details about a device for which a GFE is being requested."
* insert DraftArtifact

* status = #active
* intent = #proposal

* code[x] 1..1 MS

* subject only Reference(HRexPatientDemographics)
