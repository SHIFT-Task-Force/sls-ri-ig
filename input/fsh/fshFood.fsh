

Profile: SlsValueSet
Parent: ValueSet // ShareableValueSet  
Title: "SLS ValueSet Profile"
Description: """
Profile for ValueSets used in the SLS RI

- [Shared ValueSets](https://fhir.hl7.org/fhir/shareablevalueset.html) require `experimental`, `url`, `title`, `description`, and `status`.
- `title` and `description` are encouraged to keep track of the purpose and use of the ValueSet as it is not always clear from the content of the ValueSet itself.
- `compose.inactive` tends to need to be `true` as the ValueSet is covering historic data that may have been coded long ago when the now inactive codes were allowed.
- `useContext` of focus is the tag value applied to data that matches a code in this ValueSet
  - `display` values are discouraged as they simply add size to the tagged output.
  - in R5/R6 the `topic` value can be used.
- `date` is the date the ValueSet was created or last updated. This value will be used by the SLS RI to determine if the data being inspected was last inspected before the last update of the ValueSet.
- `expansion.timestamp` is the date the ValueSet was expanded. This value will be used by the SLS RI to determine if the data being inspected was last inspected before the last expansion of the ValueSet.
- `expansion` SHOULD provide expanded ValueSet as that give the definitive list of codes and a timestamp for when the expansion was performed. This allows the SLS RI to determine if the data being inspected matches any of the codes in the ValueSet without having to perform an expansion itself.
  - The RI can expand the ValueSet itself if the expansion is not provided, but this expansion limits the timestamp to now, thus forcing inspection of all data even when the actual valueSet has not changed.
  - The expansion is done by an external service which is then a dependency. The SLS RI uses tx.fhir.org terminology service.
"""
* useContext 1..* MS
* useContext ^slicing.discriminator[0].type = #value
* useContext ^slicing.discriminator[0].path = "code"
* useContext ^slicing.rules = #open
* useContext contains SLS-tag 1..* MS
* useContext ^comment = "The useContext of focus is the tag value applied to data that matches a code in this ValueSet. Display values are discouraged as they simply add size to the tagged output."
* useContext[SLS-tag].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus (exactly)
* useContext[SLS-tag].valueCodeableConcept 1..1 MS
* useContext[SLS-tag].valueCodeableConcept from http://hl7.org/fhir/ValueSet/security-labels (extensible)
* date MS
* date ^comment = "The date the ValueSet was created or last updated. This value will be used by the SLS RI to determine if the data being inspected was last inspected before the last update of the ValueSet."
* expansion MS
* expansion ^comment = "The expansion element SHOULD be present and have the codes expanded with a timestamp indicating when the expansion was performed. "
* expansion.timestamp MS
* expansion.timestamp ^comment = "The date the ValueSet was expanded. This value will be used by the SLS RI to determine if the data being inspected was last inspected before the last expansion of the ValueSet."
* expansion.contains MS
* expansion.contains ^comment = "The expansion element SHOULD contain the codes that are in the ValueSet. This allows the SLS RI to determine if the data being inspected matches any of the codes in the ValueSet without having to perform an expansion itself."
* compose.inactive MS
* compose.inactive ^comment = "The compose.inactive element tends to need to be true as the ValueSet is covering historic data that may have been coded long ago when the now inactive codes were allowed."




Instance: mental-health-conditions
InstanceOf: SlsValueSet
Title: "Mental Health Conditions ValueSet"
Description: "ValueSet for mental health conditions used in the SLS RI. This ValueSet includes codes for mental health conditions that are relevant to the SLS use cases."
* url = "http://example.org/fhir/ValueSet/mental-health-conditions"
* version = "1.0.0"
* experimental = false
* name = "MentalHealthConditions"
* title = "Mental Health Conditions"
* description = "ValueSet for mental health conditions used in the SLS RI. This ValueSet includes codes for mental health conditions that are relevant to the SLS use cases."
* status = #active
* date = "2024-01-01T00:00:00Z"
* useContext[SLS-tag].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#PSY
* expansion.timestamp = "2024-01-01T00:00:00Z"
* expansion.contains[0].system = "http://snomed.info/sct"
* expansion.contains[=].code = #35489007
* expansion.contains[=].display = "Depressive disorder"
* expansion.contains[+].system = "http://snomed.info/sct"
* expansion.contains[=].code = #197480006
* expansion.contains[=].display = "Anxiety disorder"
* expansion.contains[+].system = "http://snomed.info/sct"
* expansion.contains[=].code = #58214004
* expansion.contains[=].display = "Schizophrenia"

Instance: substance-abuse
InstanceOf: SlsValueSet
Title: "Substance Abuse Conditions ValueSet"
Description: "ValueSet for substance abuse conditions used in the SLS RI. This ValueSet includes codes for substance abuse conditions that are relevant to the SLS use cases."
* url = "http://example.org/fhir/ValueSet/substance-abuse"
* version = "1.0.0"
* experimental = false
* name = "SubstanceAbuse"
* title = "Substance Abuse Conditions"
* description = "ValueSet for substance abuse conditions used in the SLS RI. This ValueSet includes codes for substance abuse conditions that are relevant to the SLS use cases."
* status = #active
* date = "2024-01-01T00:00:00Z"
* useContext[SLS-tag].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#ETH
* expansion.timestamp = "2024-01-01T00:00:00Z"
* expansion.contains[0].system = "http://snomed.info/sct"
* expansion.contains[=].code = #191816009
* expansion.contains[=].display = "Alcohol abuse"
* expansion.contains[+].system = "http://snomed.info/sct"
* expansion.contains[=].code = #191820008
* expansion.contains[=].display = "Drug abuse"
* expansion.contains[+].system = "http://snomed.info/sct"
* expansion.contains[=].code = #66214007
* expansion.contains[=].display = "Substance abuse (disorder)"

Instance: behavioral-health-multi-topic
InstanceOf: SlsValueSet
Title: "Behavioral Health - Multiple Topics ValueSet"
Description: "ValueSet for behavioral health conditions that span multiple topics used in the SLS RI. This ValueSet includes codes for behavioral health conditions that are relevant to the SLS use cases and may span multiple topics such as mental health, substance abuse, and psychotherapy notes."
* url = "http://example.org/fhir/ValueSet/behavioral-health-multi-topic"
* version = "1.0.0"
* name = "BehavioralHealthMultiTopic"
* title = "Behavioral Health - Multiple Topics"
* status = #active
* experimental = false
* description = "ValueSet for behavioral health conditions that span multiple topics used in the SLS RI. This ValueSet includes codes for behavioral health conditions that are relevant to the SLS use cases and may span multiple topics such as mental health, substance abuse, and psychotherapy notes."
* date = "2024-01-01T00:00:00Z"
* useContext[SLS-tag][+].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#PSYTHPN
* useContext[SLS-tag][+].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#SUD
* useContext[SLS-tag][+].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#BH
* expansion.timestamp = "2024-01-01T00:00:00Z"
* expansion.contains[0].system = "http://snomed.info/sct"
* expansion.contains[=].code = #66214007
* expansion.contains[=].display = "Substance abuse (disorder)"
* expansion.contains[+].system = "http://snomed.info/sct"
* expansion.contains[=].code = #74732009
* expansion.contains[=].display = "Mental disorder"