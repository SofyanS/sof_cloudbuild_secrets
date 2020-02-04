# Pull from github


# Create keyring and encryption key
gcloud kms keyrings create tinkering --location=global

gcloud  kms keys create cloud-build-demo \
  --keyring=tinkering \
  --purpose=encryption \
  --location=global

# Encrypt secret string from github
echo -n "This is the super secret secret." | gcloud kms encrypt \
  --plaintext-file=- \
  --ciphertext-file=- \
  --location=global \
  --keyring=tinkering \
  --key=cloud-build-demo | base64