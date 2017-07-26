# ScaleIT Platform Specification

## HTTP Header Augmentation

The HTTP Header will get augmented by the app-router component.

They follow the Subject-Predicate-Object pattern, where the Subject is the Request, and the Predicate and Object are the fields the app will work with.

```<dash separated ontology namespace>--<predicate>: <object value>```

Example:
```X-SPE-LICENSE-MANAGER--HAS-LICENSE-VECTOR: http://x-spe-license-manager/license-vector/34567890```

The Object of the Header will usually contain a URI to a ressource, possibly one co-located within the app sidecars.

### Cache Control

Sidecar communication should be done using HTTP GET. This is due to the caching mechanisms of the HTTP protocol that allow only GET request caching.

Beware of race conditions when requesting user-bound licenses. Caching may result in wrongly giving access to users with expired licenses. The opposite may also be true. The Platform should ensure that all sidecars are informed as soon as possible of changes.


### Platform Headers

Namespace: X-SP-SCALEIT-PLATFORM

| HTTP Header        | Values          | Example  |
| ------------- |:-------------:| :-----|
| ```IS-VERIFIED```    |  | ```X-SP-SCALEIT-PLATFORM--IS-VERIFIED: TRUE``` |
| ```HAS-SIGNATURE```      | ...       | ```X-SP-SCALEIT-PLATFORM--HAS-SIGNATURE: vtPgjlnEyul45gdb3KfetsvBuhndyuwfiHRdsvkma9```   |
| ...  | ...       |    |


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