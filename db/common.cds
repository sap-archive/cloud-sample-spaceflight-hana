namespace common;

using {
  managed as AdminData,
  sap
} from '@sap/cds/common';

// ---------------------------------------------------------------------------------------------------------------------
// Define an ID field to be of type UUID (Universal Unique Identifier).
// Such a field is typically used as a key field and the UUID value is generated automatically.
//
// Also, inherit default admin data provided by @sap/cds/common (modifiedAt/By, createdAt/By).
// ---------------------------------------------------------------------------------------------------------------------
abstract entity Managed : AdminData {
  key ID : UUID;
}

// exclude superfluous imported entities from persistence
annotate sap.common.Languages  @(cds.persistence.skip);
annotate sap.common.Countries  @(cds.persistence.skip);
annotate sap.common.Currencies @(cds.persistence.skip);



// ------- Temporary stuff -----------------------
// TODO remove once sap/cds 2.8.0 is released
annotate Managed with {
  createdAt  @odata.on.insert: #now;
  createdBy  @odata.on.insert: #user;
  modifiedAt @odata.on.update: #now;
  modifiedBy @odata.on.update: #user;
}