# frozen_string_literal: true

ActiveRecordDoctor.configure do
  # Global settings affect all detectors.
  global :ignore_tables, [
    # Ignore internal Rails-related tables.
    "ar_internal_metadata",
    "schema_migrations",
    "active_storage_blobs",
    "active_storage_attachments",
    "action_text_rich_texts",
  ]

  global :ignore_models, [
    "ActionText::RichText",
    "ActionText::EncryptedRichText",
    "ActiveStorage::VariantRecord",
    "ActiveStorage::Blob",
    "ActiveStorage::Attachment",
    "ActionMailbox::InboundEmail",
  ]

  detector :short_primary_key_type,
           enabled: false

  detector :missing_presence_validation,
           ignore_attributes: ["User.encrypted_password"]\

  detector :mismatched_foreign_key_type,
    ignore_columns: ["active_storage_variant_records.blob_id"]
end
