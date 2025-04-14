# swagger.api.DefaultApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**countriesGet**](DefaultApi.md#countriesGet) | **GET** /countries | Retrieve all countries
[**countriesNameGet**](DefaultApi.md#countriesNameGet) | **GET** /countries/{name} | Retrieve details about a specific Country

# **countriesGet**
> List<Country> countriesGet()

Retrieve all countries

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();

try {
    var result = api_instance.countriesGet();
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->countriesGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Country>**](Country.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **countriesNameGet**
> CountryDetails countriesNameGet(name)

Retrieve details about a specific Country

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();
var name = name_example; // String | 

try {
    var result = api_instance.countriesNameGet(name);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->countriesNameGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 

### Return type

[**CountryDetails**](CountryDetails.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

