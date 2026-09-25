

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
Title: "ValueSet: Single topic with both definition and expansion"
Description: """
This ValueSet includes the definition of the ValueSet (compose include), and the expansion. Note that the display values are not necessary but are included in the compose include to confirm that the codes are what was intended by the display values.

ValueSet for mental health conditions used in the SLS RI. This ValueSet includes codes for mental health conditions that are relevant to the SLS use cases.
"""
* url = "http://example.org/fhir/ValueSet/mental-health-conditions"
* version = "1.0.0"
* experimental = false
* name = "MentalHealthConditions"
* title = "ValueSet: Single topic with both definition and expansion"
* description = """
This ValueSet includes the definition of the ValueSet (compose include), and the expansion. Note that the display values are not necessary but are included in the compose include to confirm that the codes are what was intended by the display values.

Because the expansion is specified the expansion parameter used-codesystem is included to indicate which code system was used in the expansion. The expansion timestamp and an identifier are also provided.

ValueSet for mental health conditions used in the SLS RI. This ValueSet includes codes for mental health conditions that are relevant to the SLS use cases.
"""
* status = #active
* date = "2024-01-01T00:00:00Z"
* useContext[SLS-tag].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#PSY
* compose.inactive = true
* compose.include[0].system = "http://snomed.info/sct"
* compose.include[=].concept[+].code = #35489007
* compose.include[=].concept[=].display = "Depressive disorder"
* compose.include[=].concept[+].code = #197480006
* compose.include[=].concept[=].display = "Anxiety disorder"
* compose.include[=].concept[+].code = #58214004
* compose.include[=].concept[=].display = "Schizophrenia"
* expansion.timestamp = "2024-01-01T00:00:00Z"
* expansion.identifier = "urn:uuid:123e4567-e89b-12d3-a456-426614174000"
* expansion.parameter[+].name = "used-codesystem"
* expansion.parameter[=].valueUri = "http://snomed.info/sct|20250201"
* expansion.contains[0].system = "http://snomed.info/sct"
* expansion.contains[=].code = #35489007
* expansion.contains[+].system = "http://snomed.info/sct"
* expansion.contains[=].code = #197480006
* expansion.contains[+].system = "http://snomed.info/sct"
* expansion.contains[=].code = #58214004

Instance: substance-abuse
InstanceOf: SlsValueSet
Title: "ValueSet: Single topic with only expansion"
Description: """
This ValueSet includes only the expansion, not the valueSet definition. Not sure this is valid, but it is all that the SLS-RI needs.

Because the expansion is specified the expansion parameter used-codesystem is included to indicate which code system was used in the expansion. The expansion timestamp and an identifier are also provided.

ValueSet for substance abuse conditions used in the SLS RI. This ValueSet includes codes for substance abuse conditions that are relevant to the SLS use cases.
"""
* url = "http://example.org/fhir/ValueSet/substance-abuse"
* version = "1.0.0"
* experimental = false
* name = "SubstanceAbuse"
* title = "ValueSet: Single topic with only expansion"
* description = """
This ValueSet includes only the expansion, not the valueSet definition. Not sure this is valid, but it is all that the SLS-RI needs.

ValueSet for substance abuse conditions used in the SLS RI. This ValueSet includes codes for substance abuse conditions that are relevant to the SLS use cases.
"""
* status = #active
* date = "2024-01-01T00:00:00Z"
* useContext[SLS-tag].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#ETH
//* compose.inactive = true
* expansion.timestamp = "2024-01-01T00:00:00Z"
* expansion.identifier = "urn:uuid:123e4567-e89b-12d3-a456-426614174001"
* expansion.parameter[+].name = "used-codesystem"
* expansion.parameter[=].valueUri = "http://snomed.info/sct|20250201"
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
Title: "ValueSet: Multiple Topics with no expansion"
Description: """
This ValueSet covers multiple sensitive topics, showing that the topic can have multiple values associated with it.

This ValueSet does not include the expansion, so the SLS would expand this upon importing this ValueSet. This does get the most up-to-date expansion, but because it updates the expansion timestamp may result in reevaluating previously tagged resources that don't need to be reevaluated.

ValueSet for behavioral health conditions that span multiple topics used in the SLS RI. This ValueSet includes codes for behavioral health conditions that are relevant to the SLS use cases and may span multiple topics such as mental health, substance abuse, and psychotherapy notes.
"""
* url = "http://example.org/fhir/ValueSet/behavioral-health-multi-topic"
* version = "1.0.0"
* name = "BehavioralHealthMultiTopic"
* title = "ValueSet: Multiple Topics with no expansion"
* status = #active
* experimental = false
* description = """
This ValueSet covers multiple sensitive topics, showing that the topic can have multiple values associated with it.

This ValueSet does not include the expansion, so the SLS would expand this upon importing this ValueSet. This does get the most up-to-date expansion, but because it updates the expansion timestamp may result in reevaluating previously tagged resources that don't need to be reevaluated.

ValueSet for behavioral health conditions that span multiple topics used in the SLS RI. This ValueSet includes codes for behavioral health conditions that are relevant to the SLS use cases and may span multiple topics such as mental health, substance abuse, and psychotherapy notes.
"""
* date = "2024-01-01T00:00:00Z"
* useContext[SLS-tag][+].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#PSYTHPN
* useContext[SLS-tag][+].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#SUD
* useContext[SLS-tag][+].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#BH
* compose.inactive = true
* compose.include[0].system = "http://snomed.info/sct"
* compose.include[=].concept[+].code = #66214007
* compose.include[=].concept[=].display = "Substance abuse (disorder)"
* compose.include[=].concept[+].code = #74732009
* compose.include[=].concept[=].display = "Mental disorder"
