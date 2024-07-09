# frozen_string_literal: true

ActiveRecordDoctor.configure do
  # Global settings affect all detectors.
  global :ignore_tables,
         %w[ar_internal_metadata schema_migrations active_storage_blobs
            active_storage_attachments action_text_rich_texts
            roles users_roles]

  global :ignore_models,
         %w[ActionText::RichText ActionText::EncryptedRichText
            ActiveStorage::VariantRecord ActiveStorage::Blob
            ActiveStorage::Attachment ActionMailbox::InboundEmail]

  detector :short_primary_key_type,
           enabled: false

  detector :missing_presence_validation,
           ignore_attributes: %w[User.encrypted_password User.sign_in_count]

  detector :mismatched_foreign_key_type,
           ignore_columns: ["active_storage_variant_records.blob_id"]

  detector :incorrect_length_validation,
           enabled: false
end
