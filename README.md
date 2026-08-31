# meine-issuer

Standalone OpenID4VCI issuer for mdoc/SD-JWT credentials, extracted from
[Multipaz](https://github.com/openwallet-foundation/multipaz) at tag **0.99.0**.

The two issuer modules (`multipaz-openid4vci` library + `multipaz-openid4vci-server`)
are vendored as source; all other Multipaz modules are consumed as published
Maven artifacts at 0.99.0.

## Why pinned at 0.99.0

Multipaz [PR #1904](https://github.com/openwallet-foundation/multipaz/pull/1904)
(2026-08-13) makes the issuer add `keyAuthorizations` to every MSO's
`deviceKeyInfo`. The Google Longfellow ZK circuits (v6 and v7) cannot generate
proofs over such MSOs — ZKP presentment fails with
`MDOC_PROVER_GENERAL_FAILURE` (error code 6) while classic presentment keeps
working. Version 0.99.0 predates that change, so credentials issued by this
server are ZKP-compatible.

If you ever update the vendored modules past that commit, remove the
`deviceKeyAuthorizedNamespaces = listOf(PingTransaction.mdocResponseNamespace)`
argument in `multipaz-openid4vci/.../CredentialFactoryMdl.kt`.

## Running

```sh
ngrok http 8007          # in one terminal
./run-local-issuer.sh https://YOUR-NGROK-URL
```

- Web UI (pick a credential, get an offer/QR): the ngrok URL
- Admin page: `/admin.html` (password: `meinewallet-admin`, change in the script)
- `base_url` is embedded in issuer metadata and offers — it must be the
  URL the wallet device actually reaches.

On first credential issuance the server enrolls its document-signing (DS)
certificate against `https://issuer.multipaz.org/records` (Multipaz default),
so first run needs internet. Server state (keys, sessions) is stored in a
local database created at runtime.
