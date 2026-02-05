This Implementation Guide (IG) contains the resources and profiles necessary to implement the SHIFT Task Force's Shared Legal Standards for Information Exchange (SLS). The SLS provides a framework for sharing health information while respecting patient privacy and legal requirements.

The SHIFT [SLS RI GitHub Repository](https://github.com/SHIFT-Task-Force/sls-ri) contains the source files for this IG, including FHIR profiles, value sets, and implementation guidance. This is where the details are explained and where the open-source is available.

The FHIR specification provided here is only implemented in the Server mode, not the github pages mode of the SLS-RI.

For discussion of the [SLS and ValueSets](https://build.fhir.org/ig/SHIFT-Task-Force/SLS-ValueSets/branches/main/index.html)

Example Patient Data [SHIFT Demo Scenarios IG](https://build.fhir.org/ig/SHIFT-Task-Force/demo-fhir-data)

## CapabilityStatement

The Server CapabilityStatement for this FHIR Server implementation can be found here: [CapabilityStatement](CapabilityStatement-fhir-sls-server.html). This is a `Requirements` CapabilityStatement that outlines the required functionalities for any FHIR server implementing the SLS Reference Implementation.

## Initialization Operation

The Server needs to be initialized with ValueSets using the [SLS Load ValueSets Operation Definition](OperationDefinition-sls-load-valuesets.html). This operation populates the server with the necessary ValueSets for proper functioning.

## Tagging Data Operation

The Server supports tagging data with legal tags using the [SLS Tag Data Operation Definition](OperationDefinition-security-label.html). This operation allows for the application of legal tags to FHIR resources, ensuring compliance with the SLS framework.

