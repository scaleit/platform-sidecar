# ScaleIT Platform Specification

## HTTP Header Augmentation

The HTTP Header will get augmented by the app-router component.

They follow the Subject-Predicate-Object pattern, where the Subject is the Request, and the Predicate and Object are the fields the app will work with.

Example:
```X-SPE-LICENSE-MANAGER--HAS-LICENSE-VECTOR: http://x-spe-license-manager/license-vector/34567890```

The Object of the Header will usually contain a URI to a ressource, possibly one co-located within the app sidecars.

### License Manager

Namespace: X-SPE-LICENSE-MANAGER

| HTTP Header        | Values          | Example  |
| ------------- |:-------------:| :-----|
| ```HAS-LICENSE-VECTOR```    |  | ```X-SPE-LICENSE-MANAGER--HAS-LICENSE-VECTOR: http://x-spe-license-manager/license-vector/34567890``` |
| ...      | ...       |    |
| ...  | ...       |    |

### Identity Manager

Namespace: X-SPE-IDENTITY-MANAGER

| HTTP Header        | Values          | Example  |
| ------------- |:-------------:| :-----|
| ```HAS-USER-ID```    |  | ```X-SPE-IDENTITY-MANAGER--HAS-USER-ID: http://x-spe-identity-manager/users/max.mustermann@bmw.de``` |
| ...      | ...       |    |
| ...  | ...       |    |