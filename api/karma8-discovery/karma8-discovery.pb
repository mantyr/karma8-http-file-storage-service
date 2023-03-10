
?1
google/protobuf/timestamp.protogoogle.protobuf";
	Timestamp
seconds (Rseconds
nanos (RnanosB?
com.google.protobufBTimestampProtoPZ2google.golang.org/protobuf/types/known/timestamppb??GPB?Google.Protobuf.WellKnownTypesJ?/
 ?
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# 
	
# 

$ I
	
$ I

% ,
	
% ,

& /
	
& /

' "
	

' "

( !
	
$( !
?
 ? ?? A Timestamp represents a point in time independent of any time zone or local
 calendar, encoded as a count of seconds and fractions of seconds at
 nanosecond resolution. The count is relative to an epoch at UTC midnight on
 January 1, 1970, in the proleptic Gregorian calendar which extends the
 Gregorian calendar backwards to year one.

 All minutes are 60 seconds long. Leap seconds are "smeared" so that no leap
 second table is needed for interpretation, using a [24-hour linear
 smear](https://developers.google.com/time/smear).

 The range is from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z. By
 restricting to that range, we ensure that we can convert to and from [RFC
 3339](https://www.ietf.org/rfc/rfc3339.txt) date strings.

 # Examples

 Example 1: Compute Timestamp from POSIX `time()`.

     Timestamp timestamp;
     timestamp.set_seconds(time(NULL));
     timestamp.set_nanos(0);

 Example 2: Compute Timestamp from POSIX `gettimeofday()`.

     struct timeval tv;
     gettimeofday(&tv, NULL);

     Timestamp timestamp;
     timestamp.set_seconds(tv.tv_sec);
     timestamp.set_nanos(tv.tv_usec * 1000);

 Example 3: Compute Timestamp from Win32 `GetSystemTimeAsFileTime()`.

     FILETIME ft;
     GetSystemTimeAsFileTime(&ft);
     UINT64 ticks = (((UINT64)ft.dwHighDateTime) << 32) | ft.dwLowDateTime;

     // A Windows tick is 100 nanoseconds. Windows epoch 1601-01-01T00:00:00Z
     // is 11644473600 seconds before Unix epoch 1970-01-01T00:00:00Z.
     Timestamp timestamp;
     timestamp.set_seconds((INT64) ((ticks / 10000000) - 11644473600LL));
     timestamp.set_nanos((INT32) ((ticks % 10000000) * 100));

 Example 4: Compute Timestamp from Java `System.currentTimeMillis()`.

     long millis = System.currentTimeMillis();

     Timestamp timestamp = Timestamp.newBuilder().setSeconds(millis / 1000)
         .setNanos((int) ((millis % 1000) * 1000000)).build();


 Example 5: Compute Timestamp from Java `Instant.now()`.

     Instant now = Instant.now();

     Timestamp timestamp =
         Timestamp.newBuilder().setSeconds(now.getEpochSecond())
             .setNanos(now.getNano()).build();


 Example 6: Compute Timestamp from current time in Python.

     timestamp = Timestamp()
     timestamp.GetCurrentTime()

 # JSON Mapping

 In JSON format, the Timestamp type is encoded as a string in the
 [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. That is, the
 format is "{year}-{month}-{day}T{hour}:{min}:{sec}[.{frac_sec}]Z"
 where {year} is always expressed using four digits while {month}, {day},
 {hour}, {min}, and {sec} are zero-padded to two digits each. The fractional
 seconds, which can go up to 9 digits (i.e. up to 1 nanosecond resolution),
 are optional. The "Z" suffix indicates the timezone ("UTC"); the timezone
 is required. A proto3 JSON serializer should always use UTC (as indicated by
 "Z") when printing the Timestamp type and a proto3 JSON parser should be
 able to accept both UTC and other timezones (as indicated by an offset).

 For example, "2017-01-15T01:30:15.01Z" encodes 15.01 seconds past
 01:30 UTC on January 15, 2017.

 In JavaScript, one can convert a Date object to this format using the
 standard
 [toISOString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString)
 method. In Python, a standard `datetime.datetime` object can be converted
 to this format using
 [`strftime`](https://docs.python.org/2/library/time.html#time.strftime) with
 the time format spec '%Y-%m-%dT%H:%M:%S.%fZ'. Likewise, in Java, one can use
 the Joda Time's [`ISODateTimeFormat.dateTime()`](
 http://www.joda.org/joda-time/apidocs/org/joda/time/format/ISODateTimeFormat.html#dateTime%2D%2D
 ) to obtain a formatter capable of generating timestamps in this format.




 ?
?
  ?? Represents seconds of UTC time since Unix epoch
 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
 9999-12-31T23:59:59Z inclusive.


  ?

  ?

  ?
?
 ?? Non-negative fractions of a second at nanosecond resolution. Negative
 second values with fractions must still have non-negative nanos values
 that count forward in time. Must be from 0 to 999,999,999
 inclusive.


 ?

 ?

 ?bproto3??  
?
'karma8-discovery/subjects/subject.protokarma8.discovery.subjects.v1"o
Subject

subject_id (	R	subjectIdE
subject_type (2".karma8.discovery.subjects.v1.TypeRsubjectType*E
Type
TYPE_UNSPECIFIED 
TYPE_SERVICE_ACCOUNT
	TYPE_USERBRZPgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/subjectsJ?
  

  

 %

 g
	
 g
1
  % Type это тип субъекта



 	
T
  	G TypeUnspecified это неизвестный тип субъекта


  	

  	
J
 = TypeServiceAccount это сервисный аккаунт


 

 
7
 * TypeUser это пользователь


 

 
E
  9 Subject это информация о субъекте



 
K
  > SubjectID это идентификатор субъекта


  

  	

  
9
 , SubjectType это тип субъекта


 

 

 bproto3??  
?
!karma8-discovery/files/file.protokarma8.discovery.files.v1google/protobuf/timestamp.proto'karma8-discovery/subjects/subject.proto"?
File!
namespace_id (	RnamespaceId
file_id (	RfileId
enabled (Renabled
servers (	Rservers?
creator (2%.karma8.discovery.subjects.v1.SubjectRcreator?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater9

created_at (2.google.protobuf.TimestampR	createdAt9

updated_at (2.google.protobuf.TimestampR	updatedAtBOZMgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/filesJ?

  "

  

 "
	
  )
	
 1

 d
	
 d
\
 
 "P File это информация о пространстве с файлами



 

g
  Z NamespaceID это идентификатор пространства с файлами


  

  	

  
B
 5 FileID это идентификатор файла


 

 	

 
?
 w Enabled это флаг отвечающий за доступность файла для использования


 

 

 
z
 m Servers это перечень серверов на которых хранятся части файла


 


 

 

 
o
 3b Creator это информация о субъекте который создал запись


 &

 '.

 12
?
 3? Updater это информация о субъекте который внёс последнии изменения в запись


 &

 '.

 12
F
 +9 CreatedAt это дата создания записи


 

 &

 )*
J
 !+= UpdatedAt это дата обновления записи


 !

 !&

 !)*bproto3??  
?x
google/api/http.proto
google.api"y
Http*
rules (2.google.api.HttpRuleRrulesE
fully_decode_reserved_expansion (RfullyDecodeReservedExpansion"?
HttpRule
selector (	Rselector
get (	H Rget
put (	H Rput
post (	H Rpost
delete (	H Rdelete
patch (	H Rpatch7
custom (2.google.api.CustomHttpPatternH Rcustom
body (	Rbody#
response_body (	RresponseBodyE
additional_bindings (2.google.api.HttpRuleRadditionalBindingsB	
pattern";
CustomHttpPattern
kind (	Rkind
path (	RpathBj
com.google.apiB	HttpProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations??GAPIJ?s
 ?
?
 2? Copyright 2019 Google LLC.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.



 

 
	
 

 X
	
 X

 "
	

 "

 *
	
 *

 '
	
 '

 "
	
$ "
?
  *? Defines the HTTP configuration for an API service. It contains a list of
 [HttpRule][google.api.HttpRule], each specifying the mapping of an RPC method
 to one or more HTTP REST API methods.



 
?
  !? A list of HTTP configuration rules that apply to individual API methods.

 **NOTE:** All service configuration rules follow "last one wins" order.


  !


  !

  !

  !
?
 )+? When set to true, URL path parameters will be fully URI-decoded except in
 cases of single segment matches in reserved expansion, where "%2F" will be
 left encoded.

 The default behavior is to not decode RFC 6570 reserved characters in multi
 segment matches.


 )

 )&

 ))*
?S
? ??S # gRPC Transcoding

 gRPC Transcoding is a feature for mapping between a gRPC method and one or
 more HTTP REST endpoints. It allows developers to build a single API service
 that supports both gRPC APIs and REST APIs. Many systems, including [Google
 APIs](https://github.com/googleapis/googleapis),
 [Cloud Endpoints](https://cloud.google.com/endpoints), [gRPC
 Gateway](https://github.com/grpc-ecosystem/grpc-gateway),
 and [Envoy](https://github.com/envoyproxy/envoy) proxy support this feature
 and use it for large scale production services.

 `HttpRule` defines the schema of the gRPC/REST mapping. The mapping specifies
 how different portions of the gRPC request message are mapped to the URL
 path, URL query parameters, and HTTP request body. It also controls how the
 gRPC response message is mapped to the HTTP response body. `HttpRule` is
 typically specified as an `google.api.http` annotation on the gRPC method.

 Each mapping specifies a URL path template and an HTTP method. The path
 template may refer to one or more fields in the gRPC request message, as long
 as each field is a non-repeated field with a primitive (non-message) type.
 The path template controls how fields of the request message are mapped to
 the URL path.

 Example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
             get: "/v1/{name=messages/*}"
         };
       }
     }
     message GetMessageRequest {
       string name = 1; // Mapped to URL path.
     }
     message Message {
       string text = 1; // The resource content.
     }

 This enables an HTTP REST to gRPC mapping as below:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456`  | `GetMessage(name: "messages/123456")`

 Any fields in the request message which are not bound by the path template
 automatically become HTTP query parameters if there is no HTTP request body.
 For example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
             get:"/v1/messages/{message_id}"
         };
       }
     }
     message GetMessageRequest {
       message SubMessage {
         string subfield = 1;
       }
       string message_id = 1; // Mapped to URL path.
       int64 revision = 2;    // Mapped to URL query parameter `revision`.
       SubMessage sub = 3;    // Mapped to URL query parameter `sub.subfield`.
     }

 This enables a HTTP JSON to RPC mapping as below:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456?revision=2&sub.subfield=foo` |
 `GetMessage(message_id: "123456" revision: 2 sub: SubMessage(subfield:
 "foo"))`

 Note that fields which are mapped to URL query parameters must have a
 primitive type or a repeated primitive type or a non-repeated message type.
 In the case of a repeated type, the parameter can be repeated in the URL
 as `...?param=A&param=B`. In the case of a message type, each field of the
 message is mapped to a separate parameter, such as
 `...?foo.a=A&foo.b=B&foo.c=C`.

 For HTTP methods that allow a request body, the `body` field
 specifies the mapping. Consider a REST update method on the
 message resource collection:

     service Messaging {
       rpc UpdateMessage(UpdateMessageRequest) returns (Message) {
         option (google.api.http) = {
           patch: "/v1/messages/{message_id}"
           body: "message"
         };
       }
     }
     message UpdateMessageRequest {
       string message_id = 1; // mapped to the URL
       Message message = 2;   // mapped to the body
     }

 The following HTTP JSON to RPC mapping is enabled, where the
 representation of the JSON in the request body is determined by
 protos JSON encoding:

 HTTP | gRPC
 -----|-----
 `PATCH /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id:
 "123456" message { text: "Hi!" })`

 The special name `*` can be used in the body mapping to define that
 every field not bound by the path template should be mapped to the
 request body.  This enables the following alternative definition of
 the update method:

     service Messaging {
       rpc UpdateMessage(Message) returns (Message) {
         option (google.api.http) = {
           patch: "/v1/messages/{message_id}"
           body: "*"
         };
       }
     }
     message Message {
       string message_id = 1;
       string text = 2;
     }


 The following HTTP JSON to RPC mapping is enabled:

 HTTP | gRPC
 -----|-----
 `PATCH /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id:
 "123456" text: "Hi!")`

 Note that when using `*` in the body mapping, it is not possible to
 have HTTP parameters, as all fields not bound by the path end in
 the body. This makes this option more rarely used in practice when
 defining REST APIs. The common usage of `*` is in custom methods
 which don't use the URL at all for transferring data.

 It is possible to define multiple HTTP methods for one RPC by using
 the `additional_bindings` option. Example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
           get: "/v1/messages/{message_id}"
           additional_bindings {
             get: "/v1/users/{user_id}/messages/{message_id}"
           }
         };
       }
     }
     message GetMessageRequest {
       string message_id = 1;
       string user_id = 2;
     }

 This enables the following two alternative HTTP JSON to RPC mappings:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456` | `GetMessage(message_id: "123456")`
 `GET /v1/users/me/messages/123456` | `GetMessage(user_id: "me" message_id:
 "123456")`

 ## Rules for HTTP mapping

 1. Leaf request fields (recursive expansion nested messages in the request
    message) are classified into three categories:
    - Fields referred by the path template. They are passed via the URL path.
    - Fields referred by the [HttpRule.body][google.api.HttpRule.body]. They are passed via the HTTP
      request body.
    - All other fields are passed via the URL query parameters, and the
      parameter name is the field path in the request message. A repeated
      field can be represented as multiple query parameters under the same
      name.
  2. If [HttpRule.body][google.api.HttpRule.body] is "*", there is no URL query parameter, all fields
     are passed via URL path and HTTP request body.
  3. If [HttpRule.body][google.api.HttpRule.body] is omitted, there is no HTTP request body, all
     fields are passed via URL path and URL query parameters.

 ### Path template syntax

     Template = "/" Segments [ Verb ] ;
     Segments = Segment { "/" Segment } ;
     Segment  = "*" | "**" | LITERAL | Variable ;
     Variable = "{" FieldPath [ "=" Segments ] "}" ;
     FieldPath = IDENT { "." IDENT } ;
     Verb     = ":" LITERAL ;

 The syntax `*` matches a single URL path segment. The syntax `**` matches
 zero or more URL path segments, which must be the last part of the URL path
 except the `Verb`.

 The syntax `Variable` matches part of the URL path as specified by its
 template. A variable template must not contain other variables. If a variable
 matches a single path segment, its template may be omitted, e.g. `{var}`
 is equivalent to `{var=*}`.

 The syntax `LITERAL` matches literal text in the URL path. If the `LITERAL`
 contains any reserved character, such characters should be percent-encoded
 before the matching.

 If a variable contains exactly one path segment, such as `"{var}"` or
 `"{var=*}"`, when such a variable is expanded into a URL path on the client
 side, all characters except `[-_.~0-9a-zA-Z]` are percent-encoded. The
 server side does the reverse decoding. Such variables show up in the
 [Discovery
 Document](https://developers.google.com/discovery/v1/reference/apis) as
 `{var}`.

 If a variable contains multiple path segments, such as `"{var=foo/*}"`
 or `"{var=**}"`, when such a variable is expanded into a URL path on the
 client side, all characters except `[-_.~/0-9a-zA-Z]` are percent-encoded.
 The server side does the reverse decoding, except "%2F" and "%2f" are left
 unchanged. Such variables show up in the
 [Discovery
 Document](https://developers.google.com/discovery/v1/reference/apis) as
 `{+var}`.

 ## Using gRPC API Service Configuration

 gRPC API Service Configuration (service config) is a configuration language
 for configuring a gRPC service to become a user-facing product. The
 service config is simply the YAML representation of the `google.api.Service`
 proto message.

 As an alternative to annotating your proto file, you can configure gRPC
 transcoding in your service config YAML files. You do this by specifying a
 `HttpRule` that maps the gRPC method to a REST endpoint, achieving the same
 effect as the proto annotation. This can be particularly useful if you
 have a proto that is reused in multiple services. Note that any transcoding
 specified in the service config will override any matching transcoding
 configuration in the proto.

 Example:

     http:
       rules:
         # Selects a gRPC method and applies HttpRule to it.
         - selector: example.v1.Messaging.GetMessage
           get: /v1/messages/{message_id}/{sub.subfield}

 ## Special notes

 When gRPC Transcoding is used to map a gRPC to JSON REST endpoints, the
 proto to JSON conversion must follow the [proto3
 specification](https://developers.google.com/protocol-buffers/docs/proto3#json).

 While the single segment variable follows the semantics of
 [RFC 6570](https://tools.ietf.org/html/rfc6570) Section 3.2.2 Simple String
 Expansion, the multi segment variable **does not** follow RFC 6570 Section
 3.2.3 Reserved Expansion. The reason is that the Reserved Expansion
 does not expand special characters like `?` and `#`, which would lead
 to invalid URLs. As the result, gRPC Transcoding uses a custom encoding
 for multi segment variables.

 The path variables **must not** refer to any repeated or mapped field,
 because client libraries are not capable of handling such variable expansion.

 The path variables **must not** capture the leading "/" character. The reason
 is that the most common use case "{var}" does not capture the leading "/"
 character. For consistency, all path variables must share the same behavior.

 Repeated message fields must not be mapped to URL query parameters, because
 no client library can support such complicated mapping.

 If an API needs to use a JSON array for request or response body, it can map
 the request or response body to a repeated field. However, some gRPC
 Transcoding implementations may not support this feature.


?
?
 ? Selects a method to which this rule applies.

 Refer to [selector][google.api.DocumentationRule.selector] for syntax details.


 ?

 ?	

 ?
?
 ??? Determines the URL pattern is matched by this rules. This pattern can be
 used with any of the {get|put|post|delete|patch} methods. A custom method
 can be defined using the 'custom' field.


 ?
\
?N Maps to HTTP GET. Used for listing and getting information about
 resources.


?


?

?
@
?2 Maps to HTTP PUT. Used for replacing a resource.


?


?

?
X
?J Maps to HTTP POST. Used for creating a resource or performing an action.


?


?

?
B
?4 Maps to HTTP DELETE. Used for deleting a resource.


?


?

?
A
?3 Maps to HTTP PATCH. Used for updating a resource.


?


?

?
?
?!? The custom pattern is used for specifying an HTTP method that is not
 included in the `pattern` field, such as HEAD, or "*" to leave the
 HTTP method unspecified for this rule. The wild-card rule is useful
 for services that provide content to Web (HTML) clients.


?

?

? 
?
?? The name of the request field whose value is mapped to the HTTP request
 body, or `*` for mapping all request fields not captured by the path
 pattern to the HTTP body, or omitted for not having any HTTP request body.

 NOTE: the referred field must be present at the top-level of the request
 message type.


?

?	

?
?
?? Optional. The name of the response field whose value is mapped to the HTTP
 response body. When omitted, the entire response message will be used
 as the HTTP response body.

 NOTE: The referred field must be present at the top-level of the response
 message type.


?

?	

?
?
	?-? Additional HTTP bindings for the selector. Nested bindings must
 not contain an `additional_bindings` field themselves (that is,
 the nesting may only be one level deep).


	?


	?

	?'

	?*,
G
? ?9 A custom pattern is used for defining custom HTTP verb.


?
2
 ?$ The name of this custom HTTP verb.


 ?

 ?	

 ?
5
?' The path matched by this custom verb.


?

?	

?bproto3??  
ل
 google/protobuf/descriptor.protogoogle.protobuf"M
FileDescriptorSet8
file (2$.google.protobuf.FileDescriptorProtoRfile"?
FileDescriptorProto
name (	Rname
package (	Rpackage

dependency (	R
dependency+
public_dependency
 (RpublicDependency'
weak_dependency (RweakDependencyC
message_type (2 .google.protobuf.DescriptorProtoRmessageTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeA
service (2'.google.protobuf.ServiceDescriptorProtoRserviceC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extension6
options (2.google.protobuf.FileOptionsRoptionsI
source_code_info	 (2.google.protobuf.SourceCodeInfoRsourceCodeInfo
syntax (	Rsyntax"?
DescriptorProto
name (	Rname;
field (2%.google.protobuf.FieldDescriptorProtoRfieldC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extensionA
nested_type (2 .google.protobuf.DescriptorProtoR
nestedTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeX
extension_range (2/.google.protobuf.DescriptorProto.ExtensionRangeRextensionRangeD

oneof_decl (2%.google.protobuf.OneofDescriptorProtoR	oneofDecl9
options (2.google.protobuf.MessageOptionsRoptionsU
reserved_range	 (2..google.protobuf.DescriptorProto.ReservedRangeRreservedRange#
reserved_name
 (	RreservedNamez
ExtensionRange
start (Rstart
end (Rend@
options (2&.google.protobuf.ExtensionRangeOptionsRoptions7
ReservedRange
start (Rstart
end (Rend"|
ExtensionRangeOptionsX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
FieldDescriptorProto
name (	Rname
number (RnumberA
label (2+.google.protobuf.FieldDescriptorProto.LabelRlabel>
type (2*.google.protobuf.FieldDescriptorProto.TypeRtype
	type_name (	RtypeName
extendee (	Rextendee#
default_value (	RdefaultValue
oneof_index	 (R
oneofIndex
	json_name
 (	RjsonName7
options (2.google.protobuf.FieldOptionsRoptions'
proto3_optional (Rproto3Optional"?
Type
TYPE_DOUBLE

TYPE_FLOAT

TYPE_INT64
TYPE_UINT64

TYPE_INT32
TYPE_FIXED64
TYPE_FIXED32
	TYPE_BOOL
TYPE_STRING	

TYPE_GROUP

TYPE_MESSAGE

TYPE_BYTES
TYPE_UINT32
	TYPE_ENUM
TYPE_SFIXED32
TYPE_SFIXED64
TYPE_SINT32
TYPE_SINT64"C
Label
LABEL_OPTIONAL
LABEL_REQUIRED
LABEL_REPEATED"c
OneofDescriptorProto
name (	Rname7
options (2.google.protobuf.OneofOptionsRoptions"?
EnumDescriptorProto
name (	Rname?
value (2).google.protobuf.EnumValueDescriptorProtoRvalue6
options (2.google.protobuf.EnumOptionsRoptions]
reserved_range (26.google.protobuf.EnumDescriptorProto.EnumReservedRangeRreservedRange#
reserved_name (	RreservedName;
EnumReservedRange
start (Rstart
end (Rend"?
EnumValueDescriptorProto
name (	Rname
number (Rnumber;
options (2!.google.protobuf.EnumValueOptionsRoptions"?
ServiceDescriptorProto
name (	Rname>
method (2&.google.protobuf.MethodDescriptorProtoRmethod9
options (2.google.protobuf.ServiceOptionsRoptions"?
MethodDescriptorProto
name (	Rname

input_type (	R	inputType
output_type (	R
outputType8
options (2.google.protobuf.MethodOptionsRoptions0
client_streaming (:falseRclientStreaming0
server_streaming (:falseRserverStreaming"?	
FileOptions!
java_package (	RjavaPackage0
java_outer_classname (	RjavaOuterClassname5
java_multiple_files
 (:falseRjavaMultipleFilesD
java_generate_equals_and_hash (BRjavaGenerateEqualsAndHash:
java_string_check_utf8 (:falseRjavaStringCheckUtf8S
optimize_for	 (2).google.protobuf.FileOptions.OptimizeMode:SPEEDRoptimizeFor

go_package (	R	goPackage5
cc_generic_services (:falseRccGenericServices9
java_generic_services (:falseRjavaGenericServices5
py_generic_services (:falseRpyGenericServices7
php_generic_services* (:falseRphpGenericServices%

deprecated (:falseR
deprecated.
cc_enable_arenas (:trueRccEnableArenas*
objc_class_prefix$ (	RobjcClassPrefix)
csharp_namespace% (	RcsharpNamespace!
swift_prefix' (	RswiftPrefix(
php_class_prefix( (	RphpClassPrefix#
php_namespace) (	RphpNamespace4
php_metadata_namespace, (	RphpMetadataNamespace!
ruby_package- (	RrubyPackageX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption":
OptimizeMode	
SPEED
	CODE_SIZE
LITE_RUNTIME*	?????J&'"?
MessageOptions<
message_set_wire_format (:falseRmessageSetWireFormatL
no_standard_descriptor_accessor (:falseRnoStandardDescriptorAccessor%

deprecated (:falseR
deprecated
	map_entry (RmapEntryX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????JJJJ	J	
"?
FieldOptionsA
ctype (2#.google.protobuf.FieldOptions.CType:STRINGRctype
packed (RpackedG
jstype (2$.google.protobuf.FieldOptions.JSType:	JS_NORMALRjstype
lazy (:falseRlazy%

deprecated (:falseR
deprecated
weak
 (:falseRweakX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"/
CType

STRING 
CORD
STRING_PIECE"5
JSType
	JS_NORMAL 
	JS_STRING
	JS_NUMBER*	?????J"s
OneofOptionsX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
EnumOptions
allow_alias (R
allowAlias%

deprecated (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????J"?
EnumValueOptions%

deprecated (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
ServiceOptions%

deprecated! (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
MethodOptions%

deprecated! (:falseR
deprecatedq
idempotency_level" (2/.google.protobuf.MethodOptions.IdempotencyLevel:IDEMPOTENCY_UNKNOWNRidempotencyLevelX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"P
IdempotencyLevel
IDEMPOTENCY_UNKNOWN 
NO_SIDE_EFFECTS

IDEMPOTENT*	?????"?
UninterpretedOptionA
name (2-.google.protobuf.UninterpretedOption.NamePartRname)
identifier_value (	RidentifierValue,
positive_int_value (RpositiveIntValue,
negative_int_value (RnegativeIntValue!
double_value (RdoubleValue!
string_value (RstringValue'
aggregate_value (	RaggregateValueJ
NamePart
	name_part (	RnamePart!
is_extension (RisExtension"?
SourceCodeInfoD
location (2(.google.protobuf.SourceCodeInfo.LocationRlocation?
Location
path (BRpath
span (BRspan)
leading_comments (	RleadingComments+
trailing_comments (	RtrailingComments:
leading_detached_comments (	RleadingDetachedComments"?
GeneratedCodeInfoM

annotation (2-.google.protobuf.GeneratedCodeInfo.AnnotationR
annotationm

Annotation
path (BRpath
source_file (	R
sourceFile
begin (Rbegin
end (RendB~
com.google.protobufBDescriptorProtosHZ-google.golang.org/protobuf/types/descriptorpb??GPB?Google.Protobuf.ReflectionJ??
' ?
?
' 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
2? Author: kenton@google.com (Kenton Varda)
  Based on original Protocol Buffers design by
  Sanjay Ghemawat, Jeff Dean, and others.

 The messages in this file describe the definitions found in .proto files.
 A valid .proto file can be translated directly to a FileDescriptorProto
 without any other information (e.g. without reading its imports).


) 

+ D
	
+ D

, ,
	
, ,

- 1
	
- 1

. 7
	
%. 7

/ !
	
$/ !

0 
	
0 

4 

	4 t descriptor.proto must be optimized for speed because reflection-based
 algorithms don't work during bootstrapping.

j
 8 :^ The protocol compiler can output a FileDescriptorSet containing the .proto
 files it parses.



 8

  9(

  9


  9

  9#

  9&'
/
= Z# Describes a complete .proto file.



=
9
 >", file name, relative to root of source tree


 >


 >

 >

 >
*
?" e.g. "foo", "foo.bar", etc.


?


?

?

?
4
B!' Names of files imported by this file.


B


B

B

B 
Q
D(D Indexes of the public imported files in the dependency list above.


D


D

D"

D%'
z
G&m Indexes of the weak imported files in the dependency list.
 For Google-internal migration only. Do not use.


G


G

G 

G#%
6
J,) All top-level definitions in this file.


J


J

J'

J*+

K-

K


K

K(

K+,

L.

L


L!

L")

L,-

M.

M


M

M )

M,-

	O#

	O


	O

	O

	O!"
?

U/? This field contains optional information about the original source code.
 You may safely remove this entire field without harming runtime
 functionality of the descriptors -- the information is needed only by
 development tools.



U



U


U*


U-.
]
YP The syntax of the proto file.
 The supported values are "proto2" and "proto3".


Y


Y

Y

Y
'
] } Describes a message type.



]

 ^

 ^


 ^

 ^

 ^

`*

`


`

` %

`()

a.

a


a

a )

a,-

c+

c


c

c&

c)*

d-

d


d

d(

d+,

 fk

 f


  g" Inclusive.


  g

  g

  g

  g

 h" Exclusive.


 h

 h

 h

 h

 j/

 j

 j"

 j#*

 j-.

l.

l


l

l)

l,-

n/

n


n

n *

n-.

p&

p


p

p!

p$%
?
ux? Range of reserved tag numbers. Reserved tag numbers may not be used by
 fields or extension ranges in the same message. Reserved ranges may
 not overlap.


u


 v" Inclusive.


 v

 v

 v

 v

w" Exclusive.


w

w

w

w

y,

y


y

y'

y*+
?
	|%u Reserved field names, which may not be used by fields in the same message.
 A given name may only be reserved once.


	|


	|

	|

	|"$

 ?



O
 ?:A The parser stores options it doesn't recognize here. See above.


 ?


 ?

 ?3

 ?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?
3
? ?% Describes a field within a message.


?

 ??

 ?
S
  ?C 0 is reserved for errors.
 Order is weird for historical reasons.


  ?

  ?

 ?

 ?

 ?
w
 ?g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT64 if
 negative values are likely.


 ?

 ?

 ?

 ?

 ?
w
 ?g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT32 if
 negative values are likely.


 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?
?
 	?? Tag-delimited aggregate.
 Group type is deprecated and not supported in proto3. However, Proto3
 implementations should still be able to parse the group wire format and
 treat group fields as unknown fields.


 	?

 	?
-
 
?" Length-delimited aggregate.


 
?

 
?
#
 ? New in version 2.


 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?
'
 ?" Uses ZigZag encoding.


 ?

 ?
'
 ?" Uses ZigZag encoding.


 ?

 ?

??

?
*
 ? 0 is reserved for errors


 ?

 ?

?

?

?

?

?

?

 ?

 ?


 ?

 ?

 ?

?

?


?

?

?

?

?


?

?

?
?
?? If type_name is set, this need not be set.  If both this and type_name
 are set, this must be one of TYPE_ENUM, TYPE_MESSAGE or TYPE_GROUP.


?


?

?

?
?
? ? For message and enum types, this is the name of the type.  If the name
 starts with a '.', it is fully-qualified.  Otherwise, C++-like scoping
 rules are used to find the type (i.e. first the nested types within this
 message are searched, then within the parent, on up to the root
 namespace).


?


?

?

?
~
?p For extensions, this is the name of the type being extended.  It is
 resolved in the same manner as type_name.


?


?

?

?
?
?$? For numeric types, contains the original text representation of the value.
 For booleans, "true" or "false".
 For strings, contains the default text contents (not escaped in any way).
 For bytes, contains the C escaped value.  All bytes >= 128 are escaped.
 TODO(kenton):  Base-64 encode?


?


?

?

?"#
?
?!v If set, gives the index of a oneof in the containing type's oneof_decl
 list.  This field is a member of that oneof.


?


?

?

? 
?
?!? JSON name of this field. The value is set by protocol compiler. If the
 user has set a "json_name" option on this field, that option's value
 will be used. Otherwise, it's deduced from the field's name by converting
 it to camelCase.


?


?

?

? 

	?$

	?


	?

	?

	?"#
?	

?%?	 If true, this is a proto3 "optional". When a proto3 field is optional, it
 tracks presence regardless of field type.

 When proto3_optional is true, this field must be belong to a oneof to
 signal to old proto3 clients that presence is tracked for this field. This
 oneof is known as a "synthetic" oneof, and this field must be its sole
 member (each proto3 optional field gets its own synthetic oneof). Synthetic
 oneofs exist in the descriptor only, and do not generate any API. Synthetic
 oneofs must be ordered after all "real" oneofs.

 For message fields, proto3_optional doesn't create any semantic change,
 since non-repeated message fields always track presence. However it still
 indicates the semantic detail of whether the user wrote "optional" or not.
 This can be useful for round-tripping the .proto file. For consistency we
 give message fields a synthetic oneof also, even though it is not required
 to track presence. This is especially important because the parser can't
 tell if a field is a message or an enum, so it must always create a
 synthetic oneof.

 Proto2 optional fields do not set this flag, because they already indicate
 optional with `LABEL_OPTIONAL`.



?



?


?


?"$
"
? ? Describes a oneof.


?

 ?

 ?


 ?

 ?

 ?

?$

?


?

?

?"#
'
? ? Describes an enum type.


?

 ?

 ?


 ?

 ?

 ?

?.

?


?#

?$)

?,-

?#

?


?

?

?!"
?
 ??? Range of reserved numeric values. Reserved values may not be used by
 entries in the same enum. Reserved ranges may not overlap.

 Note that this is distinct from DescriptorProto.ReservedRange in that it
 is inclusive such that it can appropriately represent the entire int32
 domain.


 ?


  ?" Inclusive.


  ?

  ?

  ?

  ?

 ?" Inclusive.


 ?

 ?

 ?

 ?
?
?0? Range of reserved numeric values. Reserved numeric values may not be used
 by enum values in the same enum declaration. Reserved ranges may not
 overlap.


?


?

?+

?./
l
?$^ Reserved enum value names, which may not be reused. A given name may only
 be reserved once.


?


?

?

?"#
1
? ?# Describes a value within an enum.


? 

 ?

 ?


 ?

 ?

 ?

?

?


?

?

?

?(

?


?

?#

?&'
$
? ? Describes a service.


?

 ?

 ?


 ?

 ?

 ?

?,

?


? 

?!'

?*+

?&

?


?

?!

?$%
0
	? ?" Describes a method of a service.


	?

	 ?

	 ?


	 ?

	 ?

	 ?
?
	?!? Input and output type names.  These are resolved in the same way as
 FieldDescriptorProto.type_name, but must refer to a message type.


	?


	?

	?

	? 

	?"

	?


	?

	?

	? !

	?%

	?


	?

	? 

	?#$
E
	?77 Identifies if client streams multiple client messages


	?


	?

	? 

	?#$

	?%6

	?&5
E
	?77 Identifies if server streams multiple server messages


	?


	?

	? 

	?#$

	?%6

	?&5
?

? ?2N ===================================================================
 Options
2? Each of the definitions above may have "options" attached.  These are
 just annotations which may cause code to be generated slightly differently
 or may contain hints for code that manipulates protocol messages.

 Clients may define custom options as extensions of the *Options messages.
 These extensions may not yet be known at parsing time, so the parser cannot
 store the values in them.  Instead it stores them in a field in the *Options
 message called uninterpreted_option. This field must have the same name
 across all *Options messages. We then use this field to populate the
 extensions when we build a descriptor, at which point all protos have been
 parsed and so all extensions are known.

 Extension numbers for custom options may be chosen as follows:
 * For options which will only be used within a single application or
   organization, or for experimental options, use field numbers 50000
   through 99999.  It is up to you to ensure that you do not use the
   same number for multiple options.
 * For options which will be published and used publicly by multiple
   independent entities, e-mail protobuf-global-extension-registry@google.com
   to reserve extension numbers. Simply provide your project name (e.g.
   Objective-C plugin) and your project website (if available) -- there's no
   need to explain how you intend to use them. Usually you only need one
   extension number. You can declare multiple options with only one extension
   number by putting them in a sub-message. See the Custom Options section of
   the docs for examples:
   https://developers.google.com/protocol-buffers/docs/proto#options
   If this turns out to be popular, a web service will be set up
   to automatically assign option numbers.



?
?

 ?#? Sets the Java package where classes generated from this .proto will be
 placed.  By default, the proto package is used, but this is often
 inappropriate because proto packages do not normally start with backwards
 domain names.



 ?



 ?


 ?


 ?!"
?

?+? Controls the name of the wrapper Java class generated for the .proto file.
 That class will always contain the .proto file's getDescriptor() method as
 well as any top-level extensions defined in the .proto file.
 If java_multiple_files is disabled, then all the other classes from the
 .proto file will be nested inside the single wrapper outer class.



?



?


?&


?)*
?

?;? If enabled, then the Java code generator will generate a separate .java
 file for each top-level message, enum, and service defined in the .proto
 file.  Thus, these types will *not* be nested inside the wrapper class
 named by java_outer_classname.  However, the wrapper class will still be
 generated to contain the file's getDescriptor() method as well as any
 top-level extensions defined in the file.



?



?


?#


?&(


?):


?*9
)

?E This option does nothing.



?



?


?-


?02


?3D


?4C
?

?>? If set true, then the Java2 code generator will generate code that
 throws an exception whenever an attempt is made to assign a non-UTF-8
 byte sequence to a string field.
 Message reflection will do the same.
 However, an extension field still accepts non-UTF-8 byte sequences.
 This option has no effect on when used with the lite runtime.



?



?


?&


?)+


?,=


?-<
L

 ??< Generated classes can be optimized for speed or code size.



 ?
D

  ?"4 Generate complete code for parsing, serialization,



  ?	


  ?
G

 ? etc.
"/ Use ReflectionOps to implement these methods.



 ?


 ?
G

 ?"7 Generate code using MessageLite and the lite runtime.



 ?


 ?


?;


?



?


?$


?'(


?):


?*9
?

?"? Sets the Go package where structs generated from this .proto will be
 placed. If omitted, the Go package will be derived from the following:
   - The basename of the package import path, if provided.
   - Otherwise, the package statement in the .proto file, if present.
   - Otherwise, the basename of the .proto file, without extension.



?



?


?


?!
?

?;? Should generic services be generated in each language?  "Generic" services
 are not specific to any particular RPC system.  They are generated by the
 main code generators in each language (without additional plugins).
 Generic services were the only kind of service generation supported by
 early versions of google.protobuf.

 Generic services are now considered deprecated in favor of using plugins
 that generate code specific to your particular RPC system.  Therefore,
 these default to false.  Old code which depends on generic services should
 explicitly set them to true.



?



?


?#


?&(


?):


?*9


?=


?



?


?%


?(*


?+<


?,;


	?;


	?



	?


	?#


	?&(


	?):


	?*9



?<



?




?



?$



?')



?*;



?+:
?

?2? Is this file deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for everything in the file, or it will be completely ignored; in the very
 least, this is a formalization for deprecating files.



?



?


?


?


? 1


?!0


?7q Enables the use of arenas for the proto messages in this file. This applies
 only to generated classes for C++.



?



?


? 


?#%


?&6


?'5
?

?)? Sets the objective c class prefix which is prepended to all objective c
 generated classes from this .proto. There is no default.



?



?


?#


?&(
I

?(; Namespace for generated classes; defaults to the package.



?



?


?"


?%'
?

?$? By default Swift generators will take the proto package and CamelCase it
 replacing '.' with underscore and use that to prefix the types/symbols
 defined. When this options is provided, they will use this value instead
 to prefix the types/symbols defined.



?



?


?


?!#
~

?(p Sets the php class prefix which is prepended to all php generated classes
 from this .proto. Default is empty.



?



?


?"


?%'
?

?%? Use this option to change the namespace of php generated classes. Default
 is empty. When this option is empty, the package name will be used for
 determining the namespace.



?



?


?


?"$
?

?.? Use this option to change the namespace of php generated metadata classes.
 Default is empty. When this option is empty, the proto file name will be
 used for determining the namespace.



?



?


?(


?+-
?

?$? Use this option to change the package of ruby generated classes. Default
 is empty. When this option is not set, the package name will be used for
 determining the ruby package.



?



?


?


?!#
|

?:n The parser stores options it doesn't recognize here.
 See the documentation for the "Options" section above.



?



?


?3


?69
?

?z Clients can define custom options in extensions of this message.
 See the documentation for the "Options" section above.



 ?


 ?


 ?


	?


	 ?


	 ?

? ?

?
?
 ?>? Set true to use the old proto1 MessageSet wire format for extensions.
 This is provided for backwards-compatibility with the MessageSet wire
 format.  You should not use this for any other reason:  It's less
 efficient, has fewer features, and is more complicated.

 The message must be defined exactly as follows:
   message Foo {
     option message_set_wire_format = true;
     extensions 4 to max;
   }
 Note that the message cannot have any defined fields; MessageSets only
 have extensions.

 All extensions of your type must be singular messages; e.g. they cannot
 be int32s, enums, or repeated messages.

 Because this is an option, the above two restrictions are not enforced by
 the protocol compiler.


 ?


 ?

 ?'

 ?*+

 ?,=

 ?-<
?
?F? Disables the generation of the standard "descriptor()" accessor, which can
 conflict with a field of the same name.  This is meant to make migration
 from proto1 easier; new code should avoid fields named "descriptor".


?


?

?/

?23

?4E

?5D
?
?1? Is this message deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the message, or it will be completely ignored; in the very least,
 this is a formalization for deprecating messages.


?


?

?

?

?0

? /

	?

	 ?

	 ?

	?

	?

	?

	?
?
?? Whether the message is an automatically generated map entry type for the
 maps field.

 For maps fields:
     map<KeyType, ValueType> map_field = 1;
 The parsed descriptor looks like:
     message MapFieldEntry {
         option map_entry = true;
         optional KeyType key = 1;
         optional ValueType value = 2;
     }
     repeated MapFieldEntry map_field = 1;

 Implementations may choose not to generate the map_entry=true message, but
 use a native map in the target language to hold the keys and values.
 The reflection APIs in such implementations still need to work as
 if the field is a repeated message field.

 NOTE: Do not set the option in .proto files. Always use the maps syntax
 instead. The option should only be implicitly set by the proto compiler
 parser.


?


?

?

?
$
	?" javalite_serializable


	?

	?

	?" javanano_as_lite


	?

	?
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?.? The ctype option instructs the C++ code generator to use a different
 representation of the field than it normally would.  See the specific
 options below.  This option is not yet implemented in the open source
 release -- sorry, we'll try to include it in a future version!


 ?


 ?

 ?

 ?

 ?-

 ?,

 ??

 ?

  ? Default mode.


  ?


  ?

 ?

 ?

 ?

 ?

 ?

 ?
?
?? The packed option can be enabled for repeated primitive fields to enable
 a more efficient representation on the wire. Rather than repeatedly
 writing the tag and type for each element, the entire array is encoded as
 a single length-delimited blob. In proto3, only explicit setting it to
 false will avoid using packed encoding.


?


?

?

?
?
?3? The jstype option determines the JavaScript type used for values of the
 field.  The option is permitted only for 64 bit integral and fixed types
 (int64, uint64, sint64, fixed64, sfixed64).  A field with jstype JS_STRING
 is represented as JavaScript string, which avoids loss of precision that
 can happen when a large value is converted to a floating point JavaScript.
 Specifying JS_NUMBER for the jstype causes the generated JavaScript code to
 use the JavaScript "number" type.  The behavior of the default option
 JS_NORMAL is implementation dependent.

 This option is an enum to permit additional types to be added, e.g.
 goog.math.Integer.


?


?

?

?

?2

?1

??

?
'
 ? Use the default type.


 ?

 ?
)
? Use JavaScript strings.


?

?
)
? Use JavaScript numbers.


?

?
?
?+? Should this field be parsed lazily?  Lazy applies only to message-type
 fields.  It means that when the outer message is initially parsed, the
 inner message's contents will not be parsed but instead stored in encoded
 form.  The inner message will actually be parsed when it is first accessed.

 This is only a hint.  Implementations are free to choose whether to use
 eager or lazy parsing regardless of the value of this option.  However,
 setting this option true suggests that the protocol author believes that
 using lazy parsing on this field is worth the additional bookkeeping
 overhead typically needed to implement it.

 This option does not affect the public interface of any generated code;
 all method signatures remain the same.  Furthermore, thread-safety of the
 interface is not affected by this option; const methods remain safe to
 call from multiple threads concurrently, while non-const methods continue
 to require exclusive access.


 Note that implementations may choose not to check required fields within
 a lazy sub-message.  That is, calling IsInitialized() on the outer message
 may return true even if the inner message has missing required fields.
 This is necessary because otherwise the inner message would have to be
 parsed in order to perform the check, defeating the purpose of lazy
 parsing.  An implementation which chooses not to check required fields
 must be consistent about it.  That is, for any particular sub-message, the
 implementation must either *always* check its required fields, or *never*
 check its required fields, regardless of whether or not the message has
 been parsed.


?


?

?

?

?*

?)
?
?1? Is this field deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for accessors, or it will be completely ignored; in the very least, this
 is a formalization for deprecating fields.


?


?

?

?

?0

? /
?
?,1 For Google-internal migration only. Do not use.


?


?

?

?

?+

?*
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

	?" removed jtype


	 ?

	 ?

? ?

?
O
 ?:A The parser stores options it doesn't recognize here. See above.


 ?


 ?

 ?3

 ?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
`
 ? R Set this option to true to allow mapping different tag names to the same
 value.


 ?


 ?

 ?

 ?
?
?1? Is this enum deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum, or it will be completely ignored; in the very least, this
 is a formalization for deprecating enums.


?


?

?

?

?0

? /

	?" javanano_as_lite


	 ?

	 ?
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?1? Is this enum value deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum value, or it will be completely ignored; in the very least,
 this is a formalization for deprecating enum values.


 ?


 ?

 ?

 ?

 ?0

 ? /
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?2? Is this service deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the service, or it will be completely ignored; in the very least,
 this is a formalization for deprecating services.
2? Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 ?


 ?

 ?

 ?

 ? 1

 ?!0
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?2? Is this method deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the method, or it will be completely ignored; in the very least,
 this is a formalization for deprecating methods.
2? Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 ?


 ?

 ?

 ?

 ? 1

 ?!0
?
 ??? Is this method side-effect-free (or safe in HTTP parlance), or idempotent,
 or neither? HTTP based RPC implementation may choose GET verb for safe
 methods, and PUT verb for idempotent methods instead of the default POST.


 ?

  ?

  ?

  ?
$
 ?" implies idempotent


 ?

 ?
7
 ?"' idempotent, but may have side effects


 ?

 ?

??&

?


?

?-

?02

?%

?$
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?
?
? ?? A message representing a option the parser does not recognize. This only
 appears in options protos created by the compiler::Parser class.
 DescriptorPool resolves these when building Descriptor objects. Therefore,
 options protos in descriptor objects (e.g. returned by Descriptor::options(),
 or produced by Descriptor::CopyTo()) will never have UninterpretedOptions
 in them.


?
?
 ??? The name of the uninterpreted option.  Each string represents a segment in
 a dot-separated name.  is_extension is true iff a segment represents an
 extension (denoted with parentheses in options specs in .proto files).
 E.g.,{ ["foo", false], ["bar.baz", true], ["qux", false] } represents
 "foo.(bar.baz).qux".


 ?


  ?"

  ?

  ?

  ?

  ? !

 ?#

 ?

 ?

 ?

 ?!"

 ?

 ?


 ?

 ?

 ?
?
?'? The value of the uninterpreted option, in whatever type the tokenizer
 identified it as during parsing. Exactly one of these should be set.


?


?

?"

?%&

?)

?


?

?$

?'(

?(

?


?

?#

?&'

?#

?


?

?

?!"

?"

?


?

?

? !

?&

?


?

?!

?$%
?
? ?j Encapsulates information about the original source file from which a
 FileDescriptorProto was generated.
2` ===================================================================
 Optional source code info


?
?
 ?!? A Location identifies a piece of source code in a .proto file which
 corresponds to a particular definition.  This information is intended
 to be useful to IDEs, code indexers, documentation generators, and similar
 tools.

 For example, say we have a file like:
   message Foo {
     optional string foo = 1;
   }
 Let's look at just the field definition:
   optional string foo = 1;
   ^       ^^     ^^  ^  ^^^
   a       bc     de  f  ghi
 We have the following locations:
   span   path               represents
   [a,i)  [ 4, 0, 2, 0 ]     The whole field definition.
   [a,b)  [ 4, 0, 2, 0, 4 ]  The label (optional).
   [c,d)  [ 4, 0, 2, 0, 5 ]  The type (string).
   [e,f)  [ 4, 0, 2, 0, 1 ]  The name (foo).
   [g,h)  [ 4, 0, 2, 0, 3 ]  The number (1).

 Notes:
 - A location may refer to a repeated field itself (i.e. not to any
   particular index within it).  This is used whenever a set of elements are
   logically enclosed in a single code segment.  For example, an entire
   extend block (possibly containing multiple extension definitions) will
   have an outer location whose path refers to the "extensions" repeated
   field without an index.
 - Multiple locations may have the same path.  This happens when a single
   logical declaration is spread out across multiple places.  The most
   obvious example is the "extend" block again -- there may be multiple
   extend blocks in the same scope, each of which will have the same path.
 - A location's span is not always a subset of its parent's span.  For
   example, the "extendee" of an extension declaration appears at the
   beginning of the "extend" block and is shared by all extensions within
   the block.
 - Just because a location's span is a subset of some other location's span
   does not mean that it is a descendant.  For example, a "group" defines
   both a type and a field in a single declaration.  Thus, the locations
   corresponding to the type and field and their components will overlap.
 - Code which tries to interpret locations should probably be designed to
   ignore those that it doesn't understand, as more types of locations could
   be recorded in the future.


 ?


 ?

 ?

 ? 

 ??

 ?

?
  ?,? Identifies which part of the FileDescriptorProto was defined at this
 location.

 Each element is a field number or an index.  They form a path from
 the root FileDescriptorProto to the place where the definition.  For
 example, this path:
   [ 4, 3, 2, 7, 1 ]
 refers to:
   file.message_type(3)  // 4, 3
       .field(7)         // 2, 7
       .name()           // 1
 This is because FileDescriptorProto.message_type has field number 4:
   repeated DescriptorProto message_type = 4;
 and DescriptorProto.field has field number 2:
   repeated FieldDescriptorProto field = 2;
 and FieldDescriptorProto.name has field number 1:
   optional string name = 1;

 Thus, the above path gives the location of a field name.  If we removed
 the last element:
   [ 4, 3, 2, 7 ]
 this path refers to the whole field declaration (from the beginning
 of the label to the terminating semicolon).


  ?

  ?

  ?

  ?

  ?+

  ?*
?
 ?,? Always has exactly three or four elements: start line, start column,
 end line (optional, otherwise assumed same as start line), end column.
 These are packed into a single field for efficiency.  Note that line
 and column numbers are zero-based -- typically you will want to add
 1 to each before displaying to a user.


 ?

 ?

 ?

 ?

 ?+

 ?*
?
 ?)? If this SourceCodeInfo represents a complete declaration, these are any
 comments appearing before and after the declaration which appear to be
 attached to the declaration.

 A series of line comments appearing on consecutive lines, with no other
 tokens appearing on those lines, will be treated as a single comment.

 leading_detached_comments will keep paragraphs of comments that appear
 before (but not connected to) the current element. Each paragraph,
 separated by empty lines, will be one comment element in the repeated
 field.

 Only the comment content is provided; comment markers (e.g. //) are
 stripped out.  For block comments, leading whitespace and an asterisk
 will be stripped from the beginning of each line other than the first.
 Newlines are included in the output.

 Examples:

   optional int32 foo = 1;  // Comment attached to foo.
   // Comment attached to bar.
   optional int32 bar = 2;

   optional string baz = 3;
   // Comment attached to baz.
   // Another line attached to baz.

   // Comment attached to qux.
   //
   // Another line attached to qux.
   optional double qux = 4;

   // Detached comment for corge. This is not leading or trailing comments
   // to qux or corge because there are blank lines separating it from
   // both.

   // Detached comment for corge paragraph 2.

   optional string corge = 5;
   /* Block comment attached
    * to corge.  Leading asterisks
    * will be removed. */
   /* Block comment attached to
    * grault. */
   optional int32 grault = 6;

   // ignored detached comments.


 ?

 ?

 ?$

 ?'(

 ?*

 ?

 ?

 ?%

 ?()

 ?2

 ?

 ?

 ?-

 ?01
?
? ?? Describes the relationship between generated code and its original source
 file. A GeneratedCodeInfo message is associated with only one generated
 source file, but may contain references to different source .proto files.


?
x
 ?%j An Annotation connects some span of text in generated code to an element
 of its generating .proto file.


 ?


 ?

 ? 

 ?#$

 ??

 ?

?
  ?, Identifies the element in the original source .proto file. This field
 is formatted the same as SourceCodeInfo.Location.path.


  ?

  ?

  ?

  ?

  ?+

  ?*
O
 ?$? Identifies the filesystem path to the original source .proto.


 ?

 ?

 ?

 ?"#
w
 ?g Identifies the starting offset in bytes in the generated code
 that relates to the identified object.


 ?

 ?

 ?

 ?
?
 ?? Identifies the ending offset in bytes in the generated code that
 relates to the identified offset. The end offset should be one past
 the last relevant byte (so the length of the text = end - begin).


 ?

 ?

 ?

 ???  
?
google/api/annotations.proto
google.apigoogle/api/http.proto google/protobuf/descriptor.proto:K
http.google.protobuf.MethodOptions?ʼ" (2.google.api.HttpRuleRhttpBn
com.google.apiBAnnotationsProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIJ?
 
?
 2? Copyright (c) 2015, Google Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 
	
  
	
 *

 X
	
 X

 "
	

 "

 1
	
 1

 '
	
 '

 "
	
$ "
	
 

  See `HttpRule`.



 $


 



 


 bproto3??  
?
google/protobuf/empty.protogoogle.protobuf"
EmptyB}
com.google.protobufB
EmptyProtoPZ.google.golang.org/protobuf/types/known/emptypb??GPB?Google.Protobuf.WellKnownTypesJ?
 3
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# E
	
# E

$ ,
	
$ ,

% +
	
% +

& "
	

& "

' !
	
$' !

( 
	
( 
?
 3 ? A generic empty message that you can re-use to avoid defining duplicated
 empty messages in your APIs. A typical example is to use it as the request
 or the response type of an API method. For instance:

     service Foo {
       rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
     }

 The JSON representation for `Empty` is empty JSON object `{}`.



 3bproto3??  
?:
$karma8-discovery/files/service.protokarma8.discovery.files.v1google/api/annotations.protogoogle/protobuf/empty.proto!karma8-discovery/files/file.proto'karma8-discovery/subjects/subject.proto"?

AddRequest!
namespace_id (	RnamespaceId
file_id (	RfileId
servers (	Rservers
enabled (Renabled?
creator (2%.karma8.discovery.subjects.v1.SubjectRcreator"
AddResponse"
ListRequest"E
ListResponse5
files (2.karma8.discovery.files.v1.FileRfiles"H

GetRequest!
namespace_id (	RnamespaceId
file_id (	RfileId"V
GetByFileNameRequest!
namespace_id (	RnamespaceId
	file_name (	RfileName"B
GetResponse3
file (2.karma8.discovery.files.v1.FileRfile"?
EnableRequest!
namespace_id (	RnamespaceId
file_id (	RfileId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater"?
DisableRequest!
namespace_id (	RnamespaceId
file_id (	RfileId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater"?
DeleteRequest!
namespace_id (	RnamespaceId
file_id (	RfileId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater2?
FileServicen
Add%.karma8.discovery.files.v1.AddRequest&.karma8.discovery.files.v1.AddResponse"????"/api/v1/files:*n
List&.karma8.discovery.files.v1.ListRequest'.karma8.discovery.files.v1.ListResponse"????/api/v1/filesu
Get%.karma8.discovery.files.v1.GetRequest&.karma8.discovery.files.v1.GetResponse"????/api/v1/files/{file_id}?
GetByFileName/.karma8.discovery.files.v1.GetByFileNameRequest&.karma8.discovery.files.v1.GetResponse"!????/api/v1/files/get-by-namer
Enable(.karma8.discovery.files.v1.EnableRequest.google.protobuf.Empty"&???? /api/v1/files/{file_id}/enableu
Disable).karma8.discovery.files.v1.DisableRequest.google.protobuf.Empty"'????!/api/v1/files/{file_id}/disablek
Delete(.karma8.discovery.files.v1.DeleteRequest.google.protobuf.Empty"????*/api/v1/files/{file_id}BOZMgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/filesJ?*
  ?

  

 "
	
  &
	
 %
	
 +
	
 1

	 d
	
	 d


  7


 
T
  F Add добавляет информацию о новом файле


  	

  


  *

  

	  ?ʼ"
q
 c List возвращает список всех зарегистрированных файлов


 


 

 !-

 

	 ?ʼ"
K
 = Get возвращает информацию о файле


 	

 


 *

 

	 ?ʼ"
k
  $] GetByFileName возвращает информацию о файле по названию


  

  (

  3>

 !#

	 ?ʼ"!#
k
 &*] Enable включает доступность файла для использования


 &

 &

 &%:

 ')

	 ?ʼ"')
n
 ,0` Disable отключает доступность файла для использования


 ,

 ,

 ,'<

 -/

	 ?ʼ"-/
H
 26: Delete удаляет информацию о файле


 2

 2

 2%:

 35

	 ?ʼ"35
t
 : Ih AddRequest это запрос на добавление информации о новом файле



 :
U
  <H NamespaceID это идентификатор пространства


  <

  <	

  <
B
 ?5 FileID это идентификатор файла


 ?

 ?	

 ?
?
 Bz Servers это перечень серверов на которых будут храниться части файла


 B


 B

 B

 B
?
 Es Enabled это флаг указывающий что файл доступен для использования


 E

 E

 E
o
 H3b Creator это информация о субъекте который создал запись


 H&

 H'.

 H12
?
L y AddResponse это ответ на запрос на добавление информации о новом файле



L
g
O \ ListRequest это запрос всех зарегистрированных файлов



O
y
R Tm ListResponse это ответ на запрос всех зарегистрированных файлов



R

 S

 S


 S

 S

 S
g
W ][ GetRequest это запрос на получение информации о файле



W
U
 YH NamespaceID это идентификатор пространства


 Y

 Y	

 Y
B
\5 FileID это идентификатор файла


\

\	

\
?
` f{ GetByFileNameRequest это запрос на получение информации о файле по названию



`
U
 bH NamespaceID это идентификатор пространства


 b

 b	

 b
:
e- FileName это название файла


e

e	

e
x
i ll GerResponse это ответ на запрос на получение информации о файле



i
K
 k> File это информация о пространстве


 k

 k

 k
?
o x? EnableRequest это запрос на включение доступности ранее выключенного файла



o
U
 qH NamespaceID это идентификатор пространства


 q

 q	

 q
B
t5 FileID это идентификатор файла


t

t	

t
?
w3? Updater это информация о субъекте который внёс последнии изменения в запись


w&

w'.

w12
m
{ ?` DisableRequest это запрос на выключение доступности файла



{
U
 }H NamespaceID это идентификатор пространства


 }

 }	

 }
C
?5 FileID это идентификатор файла


?

?	

?
?
?3? Updater это информация о субъекте который внёс последнии изменения в запись


?&

?'.

?12
j
	? ?\ DeleteRequest это запрос на удаление информации о файле


	?
V
	 ?H NamespaceID это идентификатор пространства


	 ?

	 ?	

	 ?
C
	?5 FileID это идентификатор файла


	?

	?	

	?
?
	?3? Updater это информация о субъекте который внёс последнии изменения в запись


	?&

	?'.

	?12bproto3??  
?
+karma8-discovery/namespaces/namespace.protokarma8.discovery.namespaces.v1google/protobuf/timestamp.proto'karma8-discovery/subjects/subject.proto"?
	Namespace!
namespace_id (	RnamespaceId
enabled (Renabled?
creator (2%.karma8.discovery.subjects.v1.SubjectRcreator?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater9

created_at (2.google.protobuf.TimestampR	createdAt9

updated_at (2.google.protobuf.TimestampR	updatedAtBTZRgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/namespacesJ?
  

  

 '
	
  )
	
 1

 i
	
 i
a
 
 U Namespace это информация о пространстве с файлами



 

g
  Z NamespaceID это идентификатор пространства с файлами


  

  	

  
?
 ? Enabled это флаг отвечающий за доступность файлов в пространстве для использования


 

 

 
o
 3b Creator это информация о субъекте который создал запись


 &

 '.

 12
?
 3? Updater это информация о субъекте который внёс последнии изменения в запись


 &

 '.

 12
F
 +9 CreatedAt это дата создания записи


 

 &

 )*
J
 += UpdatedAt это дата обновления записи


 

 &

 )*bproto3??  
?0
)karma8-discovery/namespaces/service.protokarma8.discovery.namespaces.v1google/api/annotations.protogoogle/protobuf/empty.proto+karma8-discovery/namespaces/namespace.proto'karma8-discovery/subjects/subject.proto"?

AddRequest!
namespace_id (	RnamespaceId
enabled (Renabled?
creator (2%.karma8.discovery.subjects.v1.SubjectRcreator"
AddResponse"
ListRequest"Y
ListResponseI

namespaces (2).karma8.discovery.namespaces.v1.NamespaceR
namespaces"/

GetRequest!
namespace_id (	RnamespaceId"V
GetResponseG
	namespace (2).karma8.discovery.namespaces.v1.NamespaceR	namespace"s
EnableRequest!
namespace_id (	RnamespaceId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater"t
DisableRequest!
namespace_id (	RnamespaceId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater"s
DeleteRequest!
namespace_id (	RnamespaceId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater2?
NamespaceService}
Add*.karma8.discovery.namespaces.v1.AddRequest+.karma8.discovery.namespaces.v1.AddResponse"????"/api/v1/namespaces:*}
List+.karma8.discovery.namespaces.v1.ListRequest,.karma8.discovery.namespaces.v1.ListResponse"????/api/v1/namespaces?
Get*.karma8.discovery.namespaces.v1.GetRequest+.karma8.discovery.namespaces.v1.GetResponse")????#!/api/v1/namespaces/{namespace_id}?
Enable-.karma8.discovery.namespaces.v1.EnableRequest.google.protobuf.Empty"0????*(/api/v1/namespaces/{namespace_id}/enable?
Disable..karma8.discovery.namespaces.v1.DisableRequest.google.protobuf.Empty"1????+)/api/v1/namespaces/{namespace_id}/disablez
Delete-.karma8.discovery.namespaces.v1.DeleteRequest.google.protobuf.Empty")????#*!/api/v1/namespaces/{namespace_id}BTZRgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/namespacesJ?"
  o

  

 '
	
  &
	
 %
	
 5
	
 1

	 i
	
	 i


  1


 
?
  y Add добавляет информацию о новом пространстве для хранения файлов


  	

  


  *

  

	  ?ʼ"
{
 m List возвращает список всех зарегистрированных пространств


 


 

 !-

 

	 ?ʼ"
k
 ] Get возвращает информацию о пространстве с файлами


 	

 


 *

 

	 ?ʼ"
y
  $k Enable включает доступность пространства для использования


  

  

  %:

 !#

	 ?ʼ"!#
|
 &*n Disable отключает доступность пространства для использования


 &

 &

 &'<

 ')

	 ?ʼ"')
V
 ,0H Delete удаляет информацию о пространстве


 ,

 ,

 ,%:

 -/

	 ?ʼ"-/
?
 4 =? AddRequest это запрос на добавление информации о новом пространстве для хранения файлов



 4
U
  6H NamespaceID это идентификатор пространства


  6

  6	

  6
?
 9? Enabled это флаг указывающий что пространство доступно для использования


 9

 9

 9
o
 <3b Creator это информация о субъекте который создал запись


 <&

 <'.

 <12
?
@ ? AddResponse это ответ на запрос на добавление информации о новом пространстве



@
q
C f ListRequest это запрос всех зарегистрированных пространств



C
?
F Hw ListResponse это ответ на запрос всех зарегистрированных пространств



F

 G$

 G


 G

 G

 G"#
u
K Ni GetRequest это запрос на получение информации о пространстве



K
U
 MH NamespaceID это идентификатор пространства


 M

 M	

 M
?
Q Tz GerResponse это ответ на запрос на получение информации о пространстве



Q
P
 SC Namespace это информация о пространстве


 S

 S

 S
?
W ]? EnableRequest это запрос на включение доступности ранее выключенного пространства



W
U
 YH NamespaceID это идентификатор пространства


 Y

 Y	

 Y
?
\3? Updater это информация о субъекте который внёс последнии изменения в запись


\&

\'.

\12
z
` fn DisableRequest это запрос на выключение доступности пространства



`
U
 bH NamespaceID это идентификатор пространства


 b

 b	

 b
?
e3? Updater это информация о субъекте который внёс последнии изменения в запись


e&

e'.

e12
v
i oj DeleteRequest это запрос на удаление информации о пространстве



i
U
 kH NamespaceID это идентификатор пространства


 k

 k	

 k
?
n3? Updater это информация о субъекте который внёс последнии изменения в запись


n&

n'.

n12bproto3??  
?
%karma8-discovery/servers/server.protokarma8.discovery.servers.v1google/protobuf/timestamp.proto'karma8-discovery/subjects/subject.proto"?
Server
	server_id (	RserverId
host (	Rhost
port (Rport?
creator (2%.karma8.discovery.subjects.v1.SubjectRcreator?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater9

created_at (2.google.protobuf.TimestampR	createdAt9

updated_at (2.google.protobuf.TimestampR	updatedAtBQZOgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/serversJ?
  

  

 $
	
  )
	
 1

 f
	
 f
B
 
 6 Server это информация о сервере



 

H
  ; ServerID это идентификатор сервера


  

  	

  
Y
 L Host это адрес по которому отвечает сервер


 

 	

 
W
 J Port это порт по которому отвечает сервер


 

 

 
o
 3b Creator это информация о субъекте который создал запись


 &

 '.

 12
?
 3? Updater это информация о субъекте который внёс последнии изменения в запись


 &

 '.

 12
F
 +9 CreatedAt это дата создания записи


 

 &

 )*
J
 += UpdatedAt это дата обновления записи


 

 &

 )*bproto3??  
?4
&karma8-discovery/servers/service.protokarma8.discovery.servers.v1google/api/annotations.protogoogle/protobuf/empty.proto%karma8-discovery/servers/server.proto'karma8-discovery/subjects/subject.proto"?

AddRequest
	server_id (	RserverId
host (	Rhost
port (Rport?
creator (2%.karma8.discovery.subjects.v1.SubjectRcreator"
AddResponse"
ListRequest"4
ListForNextFileRequest
quantity (Rquantity"M
ListResponse=
servers (2#.karma8.discovery.servers.v1.ServerRservers")

GetRequest
	server_id (	RserverId"J
GetResponse;
server (2#.karma8.discovery.servers.v1.ServerRserver"m
EnableRequest
	server_id (	RserverId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater"n
DisableRequest
	server_id (	RserverId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater"m
DeleteRequest
	server_id (	RserverId?
updater (2%.karma8.discovery.subjects.v1.SubjectRupdater2?
ServerServicet
Add'.karma8.discovery.servers.v1.AddRequest(.karma8.discovery.servers.v1.AddResponse"????"/api/v1/servers:*t
List(.karma8.discovery.servers.v1.ListRequest).karma8.discovery.servers.v1.ListResponse"????/api/v1/servers?
ListForNextFile3.karma8.discovery.servers.v1.ListForNextFileRequest).karma8.discovery.servers.v1.ListResponse"*????$"/api/v1/servers/list-for-next-file}
Get'.karma8.discovery.servers.v1.GetRequest(.karma8.discovery.servers.v1.GetResponse"#????/api/v1/servers/{server_id}x
Enable*.karma8.discovery.servers.v1.EnableRequest.google.protobuf.Empty"*????$"/api/v1/servers/{server_id}/enable{
Disable+.karma8.discovery.servers.v1.DisableRequest.google.protobuf.Empty"+????%#/api/v1/servers/{server_id}/disableq
Delete*.karma8.discovery.servers.v1.DeleteRequest.google.protobuf.Empty"#????*/api/v1/servers/{server_id}BQZOgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/serversJ?$
  }

  

 $
	
  &
	
 %
	
 /
	
 1

	 f
	
	 f


  7


 
v
  h Add добавляет информацию о новом сервере хранения файлов


  	

  


  *

  

	  ?ʼ"
u
 g List возвращает список всех зарегистрированных серверов


 


 

 !-

 

	 ?ʼ"
?
 ? ListForNextFile возвращает список серверов, наиболее подходящих для хранения следующего файла


 

 ,

 7C

 

	 ?ʼ"
O
  $A Get возвращает информацию о сервере


  	

  


  *

 !#

	 ?ʼ"!#
o
 &*a Enable включает доступность сервера для использования


 &

 &

 &%:

 ')

	 ?ʼ"')
r
 ,0d Disable отключает доступность сервера для использования


 ,

 ,

 ,'<

 -/

	 ?ʼ"-/
L
 26> Delete удаляет информацию о сервере


 2

 2

 2%:

 35

	 ?ʼ"35
?
 : F? AddRequest это запрос на добавление информации о новом сервере хранения файлов



 :
H
  <; ServerID это идентификатор сервера


  <

  <	

  <
Y
 ?L Host это адрес по которому отвечает сервер


 ?

 ?	

 ?
W
 BJ Port это порт по которому отвечает сервер


 B

 B

 B
o
 E3b Creator это информация о субъекте который создал запись


 E&

 E'.

 E12
?
I } AddResponse это ответ на запрос на добавление информации о новом сервере



I
k
L ` ListRequest это запрос всех зарегистрированных серверов



L
?
O Q? ListForNextFileRequest это запрос списка серверов подходящих для хранения следующего файла



O

 P

 P

 P

 P
}
T Vq ListResponse это ответ на запрос всех зарегистрированных серверов



T

 U

 U


 U

 U

 U
k
Y \_ GetRequest это запрос на получение информации о сервере



Y
H
 [; ServerID это идентификатор сервера


 [

 [	

 [
|
_ bp GerResponse это ответ на запрос на получение информации о сервере



_
C
 a6 Server это информация о сервере


 a

 a	

 a
?
e k? EnableRequest это запрос на включение доступности ранее выключенного сервера



e
H
 g; ServerID это идентификатор сервера


 g

 g	

 g
?
j3? Updater это информация о субъекте который внёс последнии изменения в запись


j&

j'.

j12
p
n td DisableRequest это запрос на выключение доступности сервера



n
H
 p; ServerID это идентификатор сервера


 p

 p	

 p
?
s3? Updater это информация о субъекте который внёс последнии изменения в запись


s&

s'.

s12
l
	w }` DeleteRequest это запрос на удаление информации о сервере



	w
H
	 y; ServerID это идентификатор сервера


	 y

	 y	

	 y
?
	|3? Updater это информация о субъекте который внёс последнии изменения в запись


	|&

	|'.

	|12bproto3??  
?#
google/protobuf/struct.protogoogle.protobuf"?
Struct;
fields (2#.google.protobuf.Struct.FieldsEntryRfieldsQ
FieldsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"?
Value;

null_value (2.google.protobuf.NullValueH R	nullValue#
number_value (H RnumberValue#
string_value (	H RstringValue

bool_value (H R	boolValue<
struct_value (2.google.protobuf.StructH RstructValue;

list_value (2.google.protobuf.ListValueH R	listValueB
kind";
	ListValue.
values (2.google.protobuf.ValueRvalues*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpb??GPB?Google.Protobuf.WellKnownTypesJ?
 ^
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# 
	
# 

$ F
	
$ F

% ,
	
% ,

& ,
	
& ,

' "
	

' "

( !
	
$( !
?
 2 5? `Struct` represents a structured data value, consisting of fields
 which map to dynamically typed values. In some languages, `Struct`
 might be supported by a native representation. For example, in
 scripting languages like JS a struct is represented as an
 object. The details of that representation are described together
 with the proto support for the language.

 The JSON representation for `Struct` is JSON object.



 2
9
  4 , Unordered map of dynamically typed values.


  4

  4

  4
?
= M? `Value` represents a dynamically typed value which can be either
 null, a number, a string, a boolean, a recursive struct value, or a
 list of values. A producer of value is expected to set one of that
 variants, absence of any variant indicates an error.

 The JSON representation for `Value` is JSON value.



=
"
 ?L The kind of value.


 ?
'
 A Represents a null value.


 A

 A

 A
)
C Represents a double value.


C


C

C
)
E Represents a string value.


E


E

E
*
G Represents a boolean value.


G

G	

G
-
I  Represents a structured value.


I


I

I
-
K  Represents a repeated `Value`.


K

K

K
?
 S V? `NullValue` is a singleton enumeration to represent the null value for the
 `Value` type union.

  The JSON representation for `NullValue` is JSON `null`.



 S

  U Null value.


  U

  U
?
[ ^v `ListValue` is a wrapper around a repeated field of values.

 The JSON representation for `ListValue` is JSON array.



[
:
 ]- Repeated field of dynamically typed values.


 ]


 ]

 ]

 ]bproto3??  
՛
,protoc-gen-openapiv2/options/openapiv2.proto)grpc.gateway.protoc_gen_openapiv2.optionsgoogle/protobuf/struct.proto"?
Swagger
swagger (	RswaggerC
info (2/.grpc.gateway.protoc_gen_openapiv2.options.InfoRinfo
host (	Rhost
	base_path (	RbasePathK
schemes (21.grpc.gateway.protoc_gen_openapiv2.options.SchemeRschemes
consumes (	Rconsumes
produces (	Rproduces_
	responses
 (2A.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ResponsesEntryR	responsesq
security_definitions (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitionsRsecurityDefinitionsZ
security (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirementRsecuritye
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocsb

extensions (2B.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ExtensionsEntryR
extensionsq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	J	
J"?
	Operation
tags (	Rtags
summary (	Rsummary 
description (	Rdescriptione
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs!
operation_id (	RoperationId
consumes (	Rconsumes
produces (	Rproducesa
	responses	 (2C.grpc.gateway.protoc_gen_openapiv2.options.Operation.ResponsesEntryR	responsesK
schemes
 (21.grpc.gateway.protoc_gen_openapiv2.options.SchemeRschemes

deprecated (R
deprecatedZ
security (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirementRsecurityd

extensions (2D.grpc.gateway.protoc_gen_openapiv2.options.Operation.ExtensionsEntryR
extensionsq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	"?
Header 
description (	Rdescription
type (	Rtype
format (	Rformat
default (	Rdefault
pattern (	RpatternJJJJ	J	
J
JJJJJJJ"?
Response 
description (	RdescriptionI
schema (21.grpc.gateway.protoc_gen_openapiv2.options.SchemaRschemaZ
headers (2@.grpc.gateway.protoc_gen_openapiv2.options.Response.HeadersEntryRheaders]
examples (2A.grpc.gateway.protoc_gen_openapiv2.options.Response.ExamplesEntryRexamplesc

extensions (2C.grpc.gateway.protoc_gen_openapiv2.options.Response.ExtensionsEntryR
extensionsm
HeadersEntry
key (	RkeyG
value (21.grpc.gateway.protoc_gen_openapiv2.options.HeaderRvalue:8;
ExamplesEntry
key (	Rkey
value (	Rvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"?
Info
title (	Rtitle 
description (	Rdescription(
terms_of_service (	RtermsOfServiceL
contact (22.grpc.gateway.protoc_gen_openapiv2.options.ContactRcontactL
license (22.grpc.gateway.protoc_gen_openapiv2.options.LicenseRlicense
version (	Rversion_

extensions (2?.grpc.gateway.protoc_gen_openapiv2.options.Info.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"E
Contact
name (	Rname
url (	Rurl
email (	Remail"/
License
name (	Rname
url (	Rurl"K
ExternalDocumentation 
description (	Rdescription
url (	Rurl"?
SchemaV
json_schema (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaR
jsonSchema$
discriminator (	Rdiscriminator
	read_only (RreadOnlye
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs
example (	RexampleJ"?


JSONSchema
ref (	Rref
title (	Rtitle 
description (	Rdescription
default (	Rdefault
	read_only (RreadOnly
example	 (	Rexample
multiple_of
 (R
multipleOf
maximum (Rmaximum+
exclusive_maximum (RexclusiveMaximum
minimum (Rminimum+
exclusive_minimum (RexclusiveMinimum

max_length (R	maxLength

min_length (R	minLength
pattern (	Rpattern
	max_items (RmaxItems
	min_items (RminItems!
unique_items (RuniqueItems%
max_properties (RmaxProperties%
min_properties (RminProperties
required (	Rrequired
array" (	Rarray_
type# (2K.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.JSONSchemaSimpleTypesRtype
format$ (	Rformat
enum. (	Renumz
field_configuration? (2H.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.FieldConfigurationRfieldConfiguratione

extensions0 (2E.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.ExtensionsEntryR
extensions<
FieldConfiguration&
path_param_name/ (	RpathParamNameU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"w
JSONSchemaSimpleTypes
UNKNOWN 	
ARRAY
BOOLEAN
INTEGER
NULL

NUMBER

OBJECT

STRINGJJJJJJJJJJ"J%*J*+J+."?
Tag 
description (	Rdescriptione
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocsJ"?
SecurityDefinitionsh
security (2L.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitions.SecurityEntryRsecurityv
SecurityEntry
key (	RkeyO
value (29.grpc.gateway.protoc_gen_openapiv2.options.SecuritySchemeRvalue:8"?
SecuritySchemeR
type (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.TypeRtype 
description (	Rdescription
name (	RnameL
in (2<.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.InRinR
flow (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.FlowRflow+
authorization_url (	RauthorizationUrl
	token_url (	RtokenUrlI
scopes (21.grpc.gateway.protoc_gen_openapiv2.options.ScopesRscopesi

extensions	 (2I.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"K
Type
TYPE_INVALID 

TYPE_BASIC
TYPE_API_KEY
TYPE_OAUTH2"1
In

IN_INVALID 
IN_QUERY
	IN_HEADER"j
Flow
FLOW_INVALID 
FLOW_IMPLICIT
FLOW_PASSWORD
FLOW_APPLICATION
FLOW_ACCESS_CODE"?
SecurityRequirement?
security_requirement (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementEntryRsecurityRequirement0
SecurityRequirementValue
scope (	Rscope?
SecurityRequirementEntry
key (	Rkeym
value (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementValueRvalue:8"?
ScopesR
scope (2<.grpc.gateway.protoc_gen_openapiv2.options.Scopes.ScopeEntryRscope8

ScopeEntry
key (	Rkey
value (	Rvalue:8*;
Scheme
UNKNOWN 
HTTP	
HTTPS
WS
WSSBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsJ??
  ?

  

 2
	
  &

 ]
	
 ]
c
 
 W Scheme describes the schemes supported by the OpenAPI Swagger
 and Operation objects.



 


  

  	

  

 

 

 	


 

 

 


 	

 

 

 


 

 	
?
 , e? `Swagger` is a representation of OpenAPI v2 specification's Swagger object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#swaggerObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      title: "Echo API";
      version: "1.0";
      description: ";
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/master/LICENSE.txt";
      };
    };
    schemes: HTTPS;
    consumes: "application/json";
    produces: "application/json";
  };




 ,
?
  0? Specifies the OpenAPI Specification version being used. It can be
 used by the OpenAPI UI and other clients to interpret the API listing. The
 value MUST be "2.0".


  0

  0	

  0
c
 3V Provides metadata about the API. The metadata can be used by the
 clients if needed.


 3

 3

 3
?
 8? The host (name or ip) serving the API. This MUST be the host only and does
 not include the scheme nor sub-paths. It MAY include a port. If the host is
 not included, the host serving the documentation is to be used (including
 the port). The host does not support path templating.


 8

 8	

 8
?
 B? The base path on which the API is served, which is relative to the host. If
 it is not included, the API is served directly under the host. The value
 MUST start with a leading slash (/). The basePath does not support path
 templating.
 Note that using `base_path` does not change the endpoint paths that are
 generated in the resulting OpenAPI file. If you wish to use `base_path`
 with relatively generated OpenAPI paths, the `base_path` prefix must be
 manually removed from your `google.api.http` paths and your code changed to
 serve the API from the `base_path`.


 B

 B	

 B
?
 F? The transfer protocol of the API. Values MUST be from the list: "http",
 "https", "ws", "wss". If the schemes is not included, the default scheme to
 be used is the one used to access the OpenAPI definition itself.


 F


 F

 F

 F
?
 J? A list of MIME types the APIs can consume. This is global to all APIs but
 can be overridden on specific API calls. Value MUST be as described under
 Mime Types.


 J


 J

 J

 J
?
 N? A list of MIME types the APIs can produce. This is global to all APIs but
 can be overridden on specific API calls. Value MUST be as described under
 Mime Types.


 N


 N

 N

 N
.
 	P" field 8 is reserved for 'paths'.


 	 P

 	 P
?
 	Sw field 9 is reserved for 'definitions', which at this time are already
 exposed as and customizable as proto messages.


 	S

 	S
?
 V'? An object to hold responses that can be used across operations. This
 property does not define global responses for all operations.


 V

 V!

 V$&
U
 X0H Security scheme definitions that can be used across the specification.


 X

 X*

 X-/
?
 	]-? A declaration of which security schemes are applied for the API as a whole.
 The list of values describes alternative security schemes that can be used
 (that is, there is a logical OR between the security requirements).
 Individual operations can override this definition.


 	]


 	]

 	]'

 	]*,
?
 	a? field 13 is reserved for 'tags', which are supposed to be exposed as and
 customizable as proto services. TODO(ivucica): add processing of proto
 service objects into OpenAPI v2 Tag objects.


 	a

 	a
1
 
c+$ Additional external documentation.


 
c

 
c%

 
c(*

 d5

 d$

 d%/

 d24
?
? ?? `Operation` is a representation of OpenAPI v2 specification's Operation object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#operationObject

 Example:

  service EchoService {
    rpc Echo(SimpleMessage) returns (SimpleMessage) {
      option (google.api.http) = {
        get: "/v1/example/echo/{id}"
      };

      option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation) = {
        summary: "Get a message.";
        operation_id: "getMessage";
        tags: "echo";
        responses: {
          key: "200"
            value: {
            description: "OK";
          }
        }
      };
    }
  }


?
?
 ?? A list of tags for API documentation control. Tags can be used for logical
 grouping of operations by resources or any other qualifier.


 ?


 ?

 ?

 ?
?
?? A short summary of what the operation does. For maximum readability in the
 swagger-ui, this field SHOULD be less than 120 characters.


?

?	

?
v
?h A verbose explanation of the operation behavior. GFM syntax can be used for
 rich text representation.


?

?	

?
E
?*7 Additional external documentation for this operation.


?

?%

?()
?
?? Unique string used to identify the operation. The id MUST be unique among
 all operations described in the API. Tools and libraries MAY use the
 operationId to uniquely identify an operation, therefore, it is recommended
 to follow common programming naming conventions.


?

?	

?
?
?? A list of MIME types the operation can consume. This overrides the consumes
 definition at the OpenAPI Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


?


?

?

?
?
?? A list of MIME types the operation can produce. This overrides the produces
 definition at the OpenAPI Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


?


?

?

?
4
	?' field 8 is reserved for 'parameters'.


	 ?

	 ?
c
?&U The list of possible responses as they are returned from executing this
 operation.


?

?!

?$%
?
?? The transfer protocol for the operation. Values MUST be from the list:
 "http", "https", "ws", "wss". The value overrides the OpenAPI Object
 schemes definition.


?


?

?

?
?
	?y Declares this operation to be deprecated. Usage of the declared operation
 should be refrained. Default value is false.


	?

	?

	?
?

?-? A declaration of which security schemes are applied for this operation. The
 list of values describes alternative security schemes that can be used
 (that is, there is a logical OR between the security requirements). This
 definition overrides any declared top-level security. To remove a top-level
 security declaration, an empty array can be used.



?



?


?'


?*,

?5

?$

?%/

?24
?
? ?? `Header` is a representation of OpenAPI v2 specification's Header object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#headerObject



?
C
 ?5 `Description` is a short description of the header.


 ?

 ?	

 ?
?
?? The type of the object. The value MUST be one of "string", "number", "integer", or "boolean". The "array" type is not supported.


?

?	

?
P
?B `Format` The extending format for the previously mentioned type.


?

?	

?
L
	?? field 4 is reserved for 'items', but in OpenAPI-specific way.


	 ?

	 ?
p
	?c field 5 is reserved `Collection Format` Determines the format of the array if type array is used.


	?

	?
?
?? `Default` Declares the value of the header that the server will use if none is provided.
 See: https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.2.
 Unlike JSON Schema this value MUST conform to the defined type for the header.


?

?	

?
1
	?$ field 7 is reserved for 'maximum'.


	?

	?
:
	?- field 8 is reserved for 'exclusiveMaximum'.


	?

	?
1
	?$ field 9 is reserved for 'minimum'.


	?

	?
;
	?. field 10 is reserved for 'exclusiveMinimum'.


	?

	?
4
	?' field 11 is reserved for 'maxLength'.


	?

	?
4
	?' field 12 is reserved for 'minLength'.


	?

	?
l
?^ 'Pattern' See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.3.


?

?	

?
3
	?& field 14 is reserved for 'maxItems'.


	?

	?
3
	?& field 15 is reserved for 'minItems'.


		?

		?
6
	?) field 16 is reserved for 'uniqueItems'.


	
?

	
?
/
	?" field 17 is reserved for 'enum'.


	?

	?
5
	?( field 18 is reserved for 'multipleOf'.


	?

	?
?
? ?? `Response` is a representation of OpenAPI v2 specification's Response object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#responseObject



?
{
 ?m `Description` is a short description of the response.
 GFM syntax can be used for rich text representation.


 ?

 ?	

 ?
?
?? `Schema` optionally defines the structure of the response.
 If `Schema` is not provided, it means there is no content to the response.


?

?	

?
?
?"? `Headers` A list of headers that are sent with the response.
 `Header` name is expected to be a string in the canonical format of the MIME header key
 See: https://golang.org/pkg/net/textproto/#CanonicalMIMEHeaderKey


?

?

? !
?
?#? `Examples` gives per-mimetype response examples.
 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#example-object


?

?

?!"

?4

?$

?%/

?23
?
? ?? `Info` is a representation of OpenAPI v2 specification's Info object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#infoObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      title: "Echo API";
      version: "1.0";
      description: ";
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/master/LICENSE.txt";
      };
    };
    ...
  };



?
-
 ? The title of the application.


 ?

 ?	

 ?
m
?_ A short description of the application. GFM syntax can be used for rich
 text representation.


?

?	

?
1
?# The Terms of Service for the API.


?

?	

?
<
?. The contact information for the exposed API.


?	

?


?
<
?. The license information for the exposed API.


?	

?


?
q
?c Provides the version of the application API (not to be confused
 with the specification version).


?

?	

?

?4

?$

?%/

?23
?
? ?? `Contact` is a representation of OpenAPI v2 specification's Contact object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#contactObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      ...
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      ...
    };
    ...
  };



?
H
 ?: The identifying name of the contact person/organization.


 ?

 ?	

 ?
]
?O The URL pointing to the contact information. MUST be in the format of a
 URL.


?

?	

?
q
?c The email address of the contact person/organization. MUST be in the format
 of an email address.


?

?	

?
?
? ?? `License` is a representation of OpenAPI v2 specification's License object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#licenseObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      ...
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/master/LICENSE.txt";
      };
      ...
    };
    ...
  };



?
2
 ?$ The license name used for the API.


 ?

 ?	

 ?
V
?H A URL to the license used for the API. MUST be in the format of a URL.


?

?	

?
?
? ?? `ExternalDocumentation` is a representation of OpenAPI v2 specification's
 ExternalDocumentation object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#externalDocumentationObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    ...
    external_docs: {
      description: "More about gRPC-Gateway";
      url: "https://github.com/grpc-ecosystem/grpc-gateway";
    }
    ...
  };



?
v
 ?h A short description of the target documentation. GFM syntax can be used for
 rich text representation.


 ?

 ?	

 ?
\
?N The URL for the target documentation. Value MUST be in the format
 of a URL.


?

?	

?
?
? ?? `Schema` is a representation of OpenAPI v2 specification's Schema object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject



?

 ?

 ?

 ?

 ?
?
?? Adds support for polymorphism. The discriminator is the schema property
 name that is used to differentiate between other schema that inherit this
 schema. The property name used MUST be defined at this schema and it MUST
 be in the required property list. When used, the value MUST be the name of
 this schema or any schema that inherits it.


?

?	

?
?
?? Relevant only for Schema "properties" definitions. Declares the property as
 "read only". This means that it MAY be sent as part of a response but MUST
 NOT be sent as part of the request. Properties marked as readOnly being
 true SHOULD NOT be in the required list of the defined schema. Default
 value is false.


?

?

?
-
	?  field 4 is reserved for 'xml'.


	 ?

	 ?
B
?*4 Additional external documentation for this schema.


?

?%

?()
?
?| A free-form property to include an example of an instance for this schema in JSON.
 This is copied verbatim to the output.


?

?	

?
?
	? ?? `JSONSchema` represents properties from JSON Schema taken, and as used, in
 the OpenAPI v2 spec.

 This includes changes made by OpenAPI v2.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject

 See also: https://cswr.github.io/JsonSchema/spec/basic_types/,
 https://github.com/json-schema-org/json-schema-spec/blob/master/schema.json

 Example:

  message SimpleMessage {
    option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_schema) = {
      json_schema: {
        title: "SimpleMessage"
        description: "A simple message."
        required: ["id"]
      }
    };

    // Id represents the message identifier.
    string id = 1; [
        (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
          description: "The unique identifier of the simple message."
        }];
  }



	?
F
		?9 field 1 is reserved for '$id', omitted from OpenAPI v2.


		 ?

		 ?
J
		?= field 2 is reserved for '$schema', omitted from OpenAPI v2.


		?

		?
?
	 ?? Ref is used to define an external reference to include in the message.
 This could be a fully qualified proto message reference, and that type must
 be imported into the protofile. If no message is identified, the Ref will
 be used verbatim in the output.
 For example:
  `ref: ".google.protobuf.Timestamp"`.


	 ?

	 ?	

	 ?
K
		?> field 4 is reserved for '$comment', omitted from OpenAPI v2.


		?

		?
(
	? The title of the schema.


	?

	?	

	?
2
	?$ A short description of the schema.


	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?

	?
?
	?? A free-form property to include a JSON example of this field. This is copied
 verbatim to the output swagger.json. Quotes must be escaped.
 This property is the same for 2.0 and 3.0.0 https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/3.0.0.md#schemaObject  https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject


	?

	?	

	?

	?

	?

	?	

	?
s
	?e Maximum represents an inclusive upper limit for a numeric instance. The
 value of MUST be a number,


	?

	?	

	?

	?

	?

	?

	?
s
		?e minimum represents an inclusive lower limit for a numeric instance. The
 value of MUST be a number,


		?

		?	

		?

	
?

	
?

	
?

	
?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?	

	?
S
		?F field 18 is reserved for 'additionalItems', omitted from OpenAPI v2.


		?

		?
j
		?] field 19 is reserved for 'items', but in OpenAPI-specific way.
 TODO(ivucica): add 'items'?


		?

		?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?

	?
L
		?? field 23 is reserved for 'contains', omitted from OpenAPI v2.


		?

		?

	?

	?

	?	

	?

	?

	?

	?	

	?

	? 

	?


	?

	?

	?
?
		?{ field 27 is reserved for 'additionalProperties', but in OpenAPI-specific
 way. TODO(ivucica): add 'additionalProperties'?


		?

		?
O
		?B field 28 is reserved for 'definitions', omitted from OpenAPI v2.


		?

		?
~
		?q field 29 is reserved for 'properties', but in OpenAPI-specific way.
 TODO(ivucica): add 'additionalProperties'?


		?

		?
?
		?? following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 patternProperties, dependencies, propertyNames, const


			?

			?

			?
0
	?" Items in 'array' must be unique.


	?


	?

	?

	?

	 ??

	 ?

	  ?

	  ?

	  ?

	 ?

	 ?	

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?


	 ?

	 ?

	 ?


	 ?

	 ?

	 ?


	 ?

	?+

	?


	? 

	?!%

	?(*

	?
 `Format`


	?

	?	

	?
?
		?? following fields are reserved, as the properties have been omitted from
 OpenAPI v2: contentMediaType, contentEncoding, if, then, else


		
?

		
?

		
?
j
		?] field 42 is reserved for 'allOf', but in OpenAPI-specific way.
 TODO(ivucica): add 'allOf'?


		?

		?
v
		?i following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 anyOf, oneOf, not


		?

		?

		?
|
	?n Items in `enum` must be unique https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.5.1


	?


	?

	?

	?
[
	?0M Additional field level properties used when generating the OpenAPI v2 file.


	?

	?(

	?+/
?
	 ??? 'FieldConfiguration' provides additional field level properties used when generating the OpenAPI v2 file.
 These properties are not defined by OpenAPIv2, but they are used to control the generation.


	 ?

?
	  ? ? Alternative parameter name when used as path parameter. If set, this will
 be used as the complete parameter name when this field is used as a path
 parameter. Use this to avoid having auto generated path parameter names
 for overlapping paths.


	  ?


	  ?

	  ?

	?5

	?$

	?%/

	?24
?

? ?? `Tag` is a representation of OpenAPI v2 specification's Tag object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#tagObject




?
?

	?? field 1 is reserved for 'name'. In our generator, this is (to be) extracted
 from the name of proto service, and thus not exposed to the user, as
 changing tag object's name would break the link to the references to the
 tag in individual operation specifications.

 TODO(ivucica): Add 'name' property. Use it to allow override of the name of
 global Tag object, then use that name to reference the tag throughout the
 OpenAPI file.



	 ?


	 ?
f

 ?X A short description for the tag. GFM syntax can be used for rich text
 representation.



 ?


 ?	


 ?
?

?*1 Additional external documentation for this tag.



?


?%


?()
?
? ?? `SecurityDefinitions` is a representation of OpenAPI v2 specification's
 Security Definitions object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityDefinitionsObject

 A declaration of the security schemes available to be used in the
 specification. This does not enforce the security schemes on the operations
 and only serves to provide the relevant details for each scheme.


?
`
 ?+R A single security scheme definition, mapping a "name" to the scheme it
 defines.


 ?

 ?&

 ?)*
?
? ?? `SecurityScheme` is a representation of OpenAPI v2 specification's
 Security Scheme object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securitySchemeObject

 Allows the definition of a security scheme that can be used by the
 operations. Supported schemes are basic authentication, an API key (either as
 a header or as a query parameter) and OAuth2's common flows (implicit,
 password, application and access code).


?
c
 ??S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?
T
??D The location of the API key. Valid values are "query" or "header".


?	

 ?

 ?

 ?

?

?

?

?

?

?
?
??w The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".


?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?
a
 ?S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 ?

 ?

 ?
8
?* A short description for security scheme.


?

?	

?
X
?J The name of the header or query parameter to be used.
 Valid for apiKey.


?

?	

?
f
?X The location of the API key. Valid values are "query" or
 "header".
 Valid for apiKey.


?

?

?

?
?? The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".
 Valid for oauth2.


?

?

?
?
?? The authorization URL to be used for this flow. This SHOULD be in
 the form of a URL.
 Valid for oauth2/implicit and oauth2/accessCode.


?

?	

?
?
?? The token URL to be used for this flow. This SHOULD be in the
 form of a URL.
 Valid for oauth2/password, oauth2/application and oauth2/accessCode.


?

?	

?
W
?I The available scopes for the OAuth2 security scheme.
 Valid for oauth2.


?

?	

?

?4

?$

?%/

?23
?
? ?? `SecurityRequirement` is a representation of OpenAPI v2 specification's
 Security Requirement object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityRequirementObject

 Lists the required security schemes to execute this operation. The object can
 have multiple security schemes declared in it which are all required (that
 is, there is a logical AND between the schemes).

 The name used for each property MUST correspond to a security scheme
 declared in the Security Definitions.


?
?
 ??? If the security scheme is of type "oauth2", then the value is a list of
 scope names required for the execution. For other security scheme types,
 the array MUST be empty.


 ?
"

  ?

  ?

  ?

  ?

  ?
?
 ?A? Each name must correspond to a security scheme which is declared in
 the Security Definitions. If the security scheme is of type "oauth2",
 then the value is a list of scope names required for the execution.
 For other security scheme types, the array MUST be empty.


 ?'

 ?(<

 ??@
?
? ?? `Scopes` is a representation of OpenAPI v2 specification's Scopes object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#scopesObject

 Lists the available scopes for an OAuth2 security scheme.


?
l
 ? ^ Maps between a name of a scope to a short description of it (as the value
 of the property).


 ?

 ?

 ?bproto3??  
?
.protoc-gen-openapiv2/options/annotations.proto)grpc.gateway.protoc_gen_openapiv2.options google/protobuf/descriptor.proto,protoc-gen-openapiv2/options/openapiv2.proto:~
openapiv2_swagger.google.protobuf.FileOptions? (22.grpc.gateway.protoc_gen_openapiv2.options.SwaggerRopenapiv2Swagger:?
openapiv2_operation.google.protobuf.MethodOptions? (24.grpc.gateway.protoc_gen_openapiv2.options.OperationRopenapiv2Operation:~
openapiv2_schema.google.protobuf.MessageOptions? (21.grpc.gateway.protoc_gen_openapiv2.options.SchemaRopenapiv2Schema:u
openapiv2_tag.google.protobuf.ServiceOptions? (2..grpc.gateway.protoc_gen_openapiv2.options.TagRopenapiv2Tag:~
openapiv2_field.google.protobuf.FieldOptions? (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaRopenapiv2FieldBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsJ?
  +

  

 2
	
  *
	
 6

 ]
	
 ]
	
	 
?
 #? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



 	"


 	


 



 "
	
 
?
'? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



$








"&
	
 
?
!? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%





	


 
	
 $
?
#? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%


#


#


#
	
% +
?
*$? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%#


*


*


*#bproto3??  
?
.karma8-discovery/swagger/swagger_options.protokarma8.discovery.swagger.v1.protoc-gen-openapiv2/options/annotations.protoB?ZOgithub.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/swagger?AFD
Karma8 Discovery API"!
Oleg Shevelevmantyr@gmail.com2	%version%JT
  

  

 $
	
  8

 f
	
 f
	
 

? bproto3??  
?,
google/protobuf/any.protogoogle.protobuf"6
Any
type_url (	RtypeUrl
value (RvalueBv
com.google.protobufBAnyProtoPZ,google.golang.org/protobuf/types/known/anypb?GPB?Google.Protobuf.WellKnownTypesJ?*
 ?
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# C
	
# C

$ ,
	
$ ,

% )
	
% )

& "
	

& "

' !
	
$' !
?
 | ?? `Any` contains an arbitrary serialized protocol buffer message along with a
 URL that describes the type of the serialized message.

 Protobuf library provides support to pack/unpack Any values in the form
 of utility functions or additional generated methods of the Any type.

 Example 1: Pack and unpack a message in C++.

     Foo foo = ...;
     Any any;
     any.PackFrom(foo);
     ...
     if (any.UnpackTo(&foo)) {
       ...
     }

 Example 2: Pack and unpack a message in Java.

     Foo foo = ...;
     Any any = Any.pack(foo);
     ...
     if (any.is(Foo.class)) {
       foo = any.unpack(Foo.class);
     }

  Example 3: Pack and unpack a message in Python.

     foo = Foo(...)
     any = Any()
     any.Pack(foo)
     ...
     if any.Is(Foo.DESCRIPTOR):
       any.Unpack(foo)
       ...

  Example 4: Pack and unpack a message in Go

      foo := &pb.Foo{...}
      any, err := anypb.New(foo)
      if err != nil {
        ...
      }
      ...
      foo := &pb.Foo{}
      if err := any.UnmarshalTo(foo); err != nil {
        ...
      }

 The pack methods provided by protobuf library will by default use
 'type.googleapis.com/full.type.name' as the type URL and the unpack
 methods only use the fully qualified type name after the last '/'
 in the type URL, for example "foo.bar.com/x/y.z" will yield type
 name "y.z".


 JSON
 ====
 The JSON representation of an `Any` value uses the regular
 representation of the deserialized, embedded message, with an
 additional field `@type` which contains the type URL. Example:

     package google.profile;
     message Person {
       string first_name = 1;
       string last_name = 2;
     }

     {
       "@type": "type.googleapis.com/google.profile.Person",
       "firstName": <string>,
       "lastName": <string>
     }

 If the embedded message type is well-known and has a custom JSON
 representation, that representation will be embedded adding a field
 `value` which holds the custom JSON in addition to the `@type`
 field. Example (for message [google.protobuf.Duration][]):

     {
       "@type": "type.googleapis.com/google.protobuf.Duration",
       "value": "1.212s"
     }




 |
?

  ??
 A URL/resource name that uniquely identifies the type of the serialized
 protocol buffer message. This string must contain at least
 one "/" character. The last segment of the URL's path must represent
 the fully qualified name of the type (as in
 `path/google.protobuf.Duration`). The name should be in a canonical form
 (e.g., leading "." is not accepted).

 In practice, teams usually precompile into the binary all types that they
 expect it to use in the context of Any. However, for URLs which use the
 scheme `http`, `https`, or no scheme, one can optionally set up a type
 server that maps type URLs to message definitions as follows:

 * If no scheme is provided, `https` is assumed.
 * An HTTP GET on the URL must yield a [google.protobuf.Type][]
   value in binary format, or produce an error.
 * Applications are allowed to cache lookup results based on the
   URL, or have them precompiled into a binary to avoid any
   lookup. Therefore, binary compatibility needs to be preserved
   on changes to types. (Use versioned type names to manage
   breaking changes.)

 Note: this functionality is not currently available in the official
 protobuf release, and it is not used for type URLs beginning with
 type.googleapis.com.

 Schemes other than `http`, `https` (or the empty scheme) might be
 used with implementation specific semantics.



  ?

  ?	

  ?
W
 ?I Must be a valid serialized protocol buffer of the above specified type.


 ?

 ?

 ?bproto3??  
?
$google/protobuf/source_context.protogoogle.protobuf",
SourceContext
	file_name (	RfileNameB?
com.google.protobufBSourceContextProtoPZ6google.golang.org/protobuf/types/known/sourcecontextpb?GPB?Google.Protobuf.WellKnownTypesJ?
 /
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# ,
	
# ,

$ 3
	
$ 3

% "
	

% "

& !
	
$& !

' M
	
' M
?
 + /w `SourceContext` represents information about the source of a
 protobuf element, like the file in which it is defined.



 +
?
  .? The path-qualified name of the .proto file that contained the associated
 protobuf element.  For example: `"google/protobuf/source_context.proto"`.


  .

  .	

  .bproto3??  
?F
google/protobuf/type.protogoogle.protobufgoogle/protobuf/any.proto$google/protobuf/source_context.proto"?
Type
name (	Rname.
fields (2.google.protobuf.FieldRfields
oneofs (	Roneofs1
options (2.google.protobuf.OptionRoptionsE
source_context (2.google.protobuf.SourceContextRsourceContext/
syntax (2.google.protobuf.SyntaxRsyntax"?
Field/
kind (2.google.protobuf.Field.KindRkindD
cardinality (2".google.protobuf.Field.CardinalityRcardinality
number (Rnumber
name (	Rname
type_url (	RtypeUrl
oneof_index (R
oneofIndex
packed (Rpacked1
options	 (2.google.protobuf.OptionRoptions
	json_name
 (	RjsonName#
default_value (	RdefaultValue"?
Kind
TYPE_UNKNOWN 
TYPE_DOUBLE

TYPE_FLOAT

TYPE_INT64
TYPE_UINT64

TYPE_INT32
TYPE_FIXED64
TYPE_FIXED32
	TYPE_BOOL
TYPE_STRING	

TYPE_GROUP

TYPE_MESSAGE

TYPE_BYTES
TYPE_UINT32
	TYPE_ENUM
TYPE_SFIXED32
TYPE_SFIXED64
TYPE_SINT32
TYPE_SINT64"t
Cardinality
CARDINALITY_UNKNOWN 
CARDINALITY_OPTIONAL
CARDINALITY_REQUIRED
CARDINALITY_REPEATED"?
Enum
name (	Rname8
	enumvalue (2.google.protobuf.EnumValueR	enumvalue1
options (2.google.protobuf.OptionRoptionsE
source_context (2.google.protobuf.SourceContextRsourceContext/
syntax (2.google.protobuf.SyntaxRsyntax"j
	EnumValue
name (	Rname
number (Rnumber1
options (2.google.protobuf.OptionRoptions"H
Option
name (	Rname*
value (2.google.protobuf.AnyRvalue*.
Syntax
SYNTAX_PROTO2 
SYNTAX_PROTO3B{
com.google.protobufB	TypeProtoPZ-google.golang.org/protobuf/types/known/typepb??GPB?Google.Protobuf.WellKnownTypesJ?8
 ?
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  
	
 " #
	
# .

% ;
	
%% ;

& 
	
& 

' ,
	
' ,

( *
	
( *

) "
	

) "

* !
	
$* !

+ D
	
+ D
-
 . ;! A protocol buffer message type.



 .
0
  0# The fully qualified message name.


  0

  0	

  0
"
 2 The list of fields.


 2


 2

 2

 2
O
 4B The list of types appearing in `oneof` definitions in this type.


 4


 4

 4

 4
+
 6 The protocol buffer options.


 6


 6

 6

 6
"
 8# The source context.


 8

 8

 8!"
!
 : The source syntax.


 :

 :	

 :
0
> ?# A single field of a message type.



>
"
 @g Basic field types.


 @
$
  B Field type unknown.


  B

  B
#
 D Field type double.


 D

 D
"
 F Field type float.


 F

 F
"
 H Field type int64.


 H

 H
#
 J Field type uint64.


 J

 J
"
 L Field type int32.


 L

 L
$
 N Field type fixed64.


 N

 N
$
 P Field type fixed32.


 P

 P
!
 R Field type bool.


 R

 R
#
 	T Field type string.


 	T

 	T
F
 
V7 Field type group. Proto2 syntax only, and deprecated.


 
V

 
V
$
 X Field type message.


 X

 X
"
 Z Field type bytes.


 Z

 Z
#
 \ Field type uint32.


 \

 \
!
 ^ Field type enum.


 ^

 ^
%
 ` Field type sfixed32.


 `

 `
%
 b Field type sfixed64.


 b

 b
#
 d Field type sint32.


 d

 d
#
 f Field type sint64.


 f

 f
C
js5 Whether a field is optional, required, or repeated.


j
5
 l& For fields with unknown cardinality.


 l

 l
%
n For optional fields.


n

n
9
p* For required fields. Proto2 syntax only.


p

p
%
r For repeated fields.


r

r

 v The field type.


 v

 v

 v
%
x The field cardinality.


x

x

x
 
z The field number.


z

z

z

| The field name.


|

|	

|
?
? The field type URL, without the scheme, for message or enumeration
 types. Example: `"type.googleapis.com/google.protobuf.Timestamp"`.




	


?
?? The index of the field type in `Type.oneofs`, for message or enumeration
 types. The first type has index 1; zero means the type is not in the list.


?

?

?
F
?8 Whether to use alternative packed wire representation.


?

?

?
,
? The protocol buffer options.


?


?

?

?
$
? The field JSON name.


?

?	

?
X
	?J The string value of the default value of this field. Proto2 syntax only.


	?

	?	

	?
%
? ? Enum type definition.


?

 ? Enum type name.


 ?

 ?	

 ?
'
?# Enum value definitions.


?


?

?

?!"
(
? Protocol buffer options.


?


?

?

?
#
?# The source context.


?

?

?!"
"
? The source syntax.


?

?	

?
&
? ? Enum value definition.


?
 
 ? Enum value name.


 ?

 ?	

 ?
"
? Enum value number.


?

?

?
(
? Protocol buffer options.


?


?

?

?
g
? ?Y A protocol buffer option, which can be attached to a message, field,
 enumeration, etc.


?
?
 ?? The option's name. For protobuf built-in options (options defined in
 descriptor.proto), this is the short name. For example, `"map_entry"`.
 For custom options, it should be the fully-qualified name. For example,
 `"google.api.http"`.


 ?

 ?	

 ?
?
?? The option's value packed in an Any message. If the value is a primitive,
 the corresponding wrapper type defined in google/protobuf/wrappers.proto
 should be used. If the value is an enum, it should be stored as an int32
 value using the google.protobuf.Int32Value type.


?

?

?
I
 ? ?; The syntax in which a protocol buffer element is defined.


 ?
 
  ? Syntax `proto2`.


  ?

  ?
 
 ? Syntax `proto3`.


 ?

 ?bproto3??  
?C
google/protobuf/api.protogoogle.protobuf$google/protobuf/source_context.protogoogle/protobuf/type.proto"?
Api
name (	Rname1
methods (2.google.protobuf.MethodRmethods1
options (2.google.protobuf.OptionRoptions
version (	RversionE
source_context (2.google.protobuf.SourceContextRsourceContext.
mixins (2.google.protobuf.MixinRmixins/
syntax (2.google.protobuf.SyntaxRsyntax"?
Method
name (	Rname(
request_type_url (	RrequestTypeUrl+
request_streaming (RrequestStreaming*
response_type_url (	RresponseTypeUrl-
response_streaming (RresponseStreaming1
options (2.google.protobuf.OptionRoptions/
syntax (2.google.protobuf.SyntaxRsyntax"/
Mixin
name (	Rname
root (	RrootBv
com.google.protobufBApiProtoPZ,google.golang.org/protobuf/types/known/apipb?GPB?Google.Protobuf.WellKnownTypesJ?<
 ?
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  
	
 " .
	
# $

% ;
	
%% ;

& ,
	
& ,

' )
	
' )

( "
	

( "

) !
	
$) !

* C
	
* C
?
 5 `? Api is a light-weight descriptor for an API Interface.

 Interfaces are also described as "protocol buffer services" in some contexts,
 such as by the "service" keyword in a .proto file, but they are different
 from API Services, which represent a concrete implementation of an interface
 as opposed to simply a description of methods and bindings. They are also
 sometimes simply referred to as "APIs" in other contexts, such as the name of
 this message itself. See https://cloud.google.com/apis/design/glossary for
 detailed terminology.



 5
{
  8n The fully qualified name of this interface, including package name
 followed by the interface's simple name.


  8

  8	

  8
C
 ;6 The methods of this interface, in unspecified order.


 ;


 ;

 ;

 ;
6
 >) Any metadata attached to the interface.


 >


 >

 >

 >
?
 U? A version string for this interface. If specified, must have the form
 `major-version.minor-version`, as in `1.10`. If the minor version is
 omitted, it defaults to zero. If the entire version field is empty, the
 major version is derived from the package name, as outlined below. If the
 field is not empty, the version in the package name will be verified to be
 consistent with what is provided here.

 The versioning schema uses [semantic
 versioning](http://semver.org) where the major version number
 indicates a breaking change and the minor version an additive,
 non-breaking change. Both version numbers are signals to users
 what to expect from different versions, and should be carefully
 chosen based on the product plan.

 The major version is also reflected in the package name of the
 interface, which must end in `v<major-version>`, as in
 `google.feature.v1`. For major versions 0 and 1, the suffix can
 be omitted. Zero major versions must only be used for
 experimental, non-GA interfaces.




 U

 U	

 U
[
 Y#N Source context for the protocol buffer service represented by this
 message.


 Y

 Y

 Y!"
2
 \% Included interfaces. See [Mixin][].


 \


 \

 \

 \
0
 _# The source syntax of the service.


 _

 _	

 _
=
c x1 Method represents a method of an API interface.



c
.
 e! The simple name of this method.


 e

 e	

 e
/
h" A URL of the input message type.


h

h	

h
0
k# If true, the request is streamed.


k

k

k
2
n% The URL of the output message type.


n

n	

n
1
q$ If true, the response is streamed.


q

q

q
3
t& Any metadata attached to the method.


t


t

t

t
0
w# The source syntax of this method.


w

w	

w
?
? ?? Declares an API Interface to be included in this interface. The including
 interface must redeclare all the methods from the included interface, but
 documentation and options are inherited as follows:

 - If after comment and whitespace stripping, the documentation
   string of the redeclared method is empty, it will be inherited
   from the original method.

 - Each annotation belonging to the service config (http,
   visibility) which is not set in the redeclared method will be
   inherited.

 - If an http annotation is inherited, the path pattern will be
   modified as follows. Any version prefix will be replaced by the
   version of the including interface plus the [root][] path if
   specified.

 Example of a simple mixin:

     package google.acl.v1;
     service AccessControl {
       // Get the underlying ACL object.
       rpc GetAcl(GetAclRequest) returns (Acl) {
         option (google.api.http).get = "/v1/{resource=**}:getAcl";
       }
     }

     package google.storage.v2;
     service Storage {
       rpc GetAcl(GetAclRequest) returns (Acl);

       // Get a data record.
       rpc GetData(GetDataRequest) returns (Data) {
         option (google.api.http).get = "/v2/{resource=**}";
       }
     }

 Example of a mixin configuration:

     apis:
     - name: google.storage.v2.Storage
       mixins:
       - name: google.acl.v1.AccessControl

 The mixin construct implies that all methods in `AccessControl` are
 also declared with same name and request/response types in
 `Storage`. A documentation generator or annotation processor will
 see the effective `Storage.GetAcl` method after inheriting
 documentation and annotations as follows:

     service Storage {
       // Get the underlying ACL object.
       rpc GetAcl(GetAclRequest) returns (Acl) {
         option (google.api.http).get = "/v2/{resource=**}:getAcl";
       }
       ...
     }

 Note how the version in the path pattern changed from `v1` to `v2`.

 If the `root` field in the mixin is specified, it should be a
 relative path under which inherited HTTP paths are placed. Example:

     apis:
     - name: google.storage.v2.Storage
       mixins:
       - name: google.acl.v1.AccessControl
         root: acls

 This implies the following inherited HTTP annotation:

     service Storage {
       // Get the underlying ACL object.
       rpc GetAcl(GetAclRequest) returns (Acl) {
         option (google.api.http).get = "/v2/acls/{resource=**}:getAcl";
       }
       ...
     }


?
L
 ?> The fully qualified name of the interface which is included.


 ?

 ?	

 ?
[
?M If non-empty specifies a path under which inherited HTTP paths
 are rooted.


?

?	

?bproto3??  
?K
%google/protobuf/compiler/plugin.protogoogle.protobuf.compiler google/protobuf/descriptor.proto"c
Version
major (Rmajor
minor (Rminor
patch (Rpatch
suffix (	Rsuffix"?
CodeGeneratorRequest(
file_to_generate (	RfileToGenerate
	parameter (	R	parameterC

proto_file (2$.google.protobuf.FileDescriptorProtoR	protoFileL
compiler_version (2!.google.protobuf.compiler.VersionRcompilerVersion"?
CodeGeneratorResponse
error (	Rerror-
supported_features (RsupportedFeaturesH
file (24.google.protobuf.compiler.CodeGeneratorResponse.FileRfile?
File
name (	Rname'
insertion_point (	RinsertionPoint
content (	RcontentR
generated_code_info (2".google.protobuf.GeneratedCodeInfoRgeneratedCodeInfo"8
Feature
FEATURE_NONE 
FEATURE_PROTO3_OPTIONALBW
com.google.protobuf.compilerBPluginProtosZ)google.golang.org/protobuf/types/pluginpbJ?C
. ?
?
. 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
2? Author: kenton@google.com (Kenton Varda)

 WARNING:  The plugin interface is currently EXPERIMENTAL and is subject to
   change.

 protoc (aka the Protocol Compiler) can be extended via plugins.  A plugin is
 just a program that reads a CodeGeneratorRequest from stdin and writes a
 CodeGeneratorResponse to stdout.

 Plugins written using C++ can use google/protobuf/compiler/plugin.h instead
 of dealing with the raw protocol defined here.

 A plugin executable needs only to be placed somewhere in the path.  The
 plugin should be named "protoc-gen-$NAME", and will then be used when the
 flag "--${NAME}_out" is passed to protoc.


0 !

1 5
	
1 5

2 -
	
2 -

4 @
	
4 @
	
 6 *
6
 9 @* The version number of protocol compiler.



 9

  :

  :


  :

  :

  :

 ;

 ;


 ;

 ;

 ;

 <

 <


 <

 <

 <
?
 ?s A suffix for alpha, beta or rc release, e.g., "alpha-1", "rc2". It should
 be empty for mainline stable releases.


 ?


 ?

 ?

 ?
O
C _C An encoded CodeGeneratorRequest is written to the plugin's stdin.



C
?
 G'? The .proto files that were explicitly listed on the command-line.  The
 code generator should generate code only for these files.  Each file's
 descriptor will be included in proto_file, below.


 G


 G

 G"

 G%&
B
J 5 The generator parameter passed on the command-line.


J


J

J

J
?
Z/? FileDescriptorProtos for all files in files_to_generate and everything
 they import.  The files will appear in topological order, so each file
 appears before any file that imports it.

 protoc guarantees that all proto_files will be written after
 the fields above, even though this is not technically guaranteed by the
 protobuf wire format.  This theoretically could allow a plugin to stream
 in the FileDescriptorProtos and handle them one by one rather than read
 the entire set into memory at once.  However, as of this writing, this
 is not similarly optimized on protoc's end -- it will store all fields in
 memory at once before sending them to the plugin.

 Type names of fields and extensions in the FileDescriptorProto are always
 fully qualified.


Z


Z

Z)

Z,.
7
](* The version number of protocol compiler.


]


]

]#

]&'
L
b ?? The plugin writes an encoded CodeGeneratorResponse to stdout.



b
?
 k? Error message.  If non-empty, code generation failed.  The plugin process
 should exit with status code zero even if it reports an error in this way.

 This should be used to indicate errors in .proto files which prevent the
 code generator from generating correct code.  Errors which indicate a
 problem in protoc itself -- such as the input CodeGeneratorRequest being
 unparseable -- should be reported by writing a message to stderr and
 exiting with a non-zero status code.


 k


 k

 k

 k
?
o)| A bitmask of supported features that the code generator supports.
 This is a bitwise "or" of values from the Feature enum.


o


o

o$

o'(
+
 ru Sync with code_generator.h.


 r

  s

  s

  s

 t 

 t

 t
4
 x?% Represents a single generated file.


 x

?
  ?? The file name, relative to the output directory.  The name must not
 contain "." or ".." components and must be relative, not be absolute (so,
 the file cannot lie outside the output directory).  "/" must be used as
 the path separator, not "\".

 If the name is omitted, the content will be appended to the previous
 file.  This allows the generator to break large files into small chunks,
 and allows the generated text to be streamed back to protoc so that large
 files need not reside completely in memory at one time.  Note that as of
 this writing protoc does not optimize for this -- it will read the entire
 CodeGeneratorResponse before writing files to disk.


  ?

  ?

  ?

  ?
?
 ?(? If non-empty, indicates that the named file should already exist, and the
 content here is to be inserted into that file at a defined insertion
 point.  This feature allows a code generator to extend the output
 produced by another code generator.  The original generator may provide
 insertion points by placing special annotations in the file that look
 like:
   @@protoc_insertion_point(NAME)
 The annotation can have arbitrary text before and after it on the line,
 which allows it to be placed in a comment.  NAME should be replaced with
 an identifier naming the point -- this is what other generators will use
 as the insertion_point.  Code inserted at this point will be placed
 immediately above the line containing the insertion point (thus multiple
 insertions to the same point will come out in the order they were added).
 The double-@ is intended to make it unlikely that the generated code
 could contain things that look like insertion points by accident.

 For example, the C++ code generator places the following line in the
 .pb.h files that it generates:
   // @@protoc_insertion_point(namespace_scope)
 This line appears within the scope of the file's package namespace, but
 outside of any particular class.  Another plugin can then specify the
 insertion_point "namespace_scope" to generate additional classes or
 other declarations that should be placed in this scope.

 Note that if the line containing the insertion point begins with
 whitespace, the same whitespace will be added to every line of the
 inserted text.  This is useful for languages like Python, where
 indentation matters.  In these languages, the insertion point comment
 should be indented the same amount as any inserted code will need to be
 in order to work correctly in that context.

 The code generator that generates the initial file and the one which
 inserts into it must both run as part of a single invocation of protoc.
 Code generators are executed in the order in which they appear on the
 command line.

 If |insertion_point| is present, |name| must also be present.


 ?

 ?

 ?#

 ?&'
$
 ?! The file contents.


 ?

 ?

 ?

 ? 
?
 ?8? Information describing the file content being inserted. If an insertion
 point is used, this information will be appropriately offset and inserted
 into the code generation metadata for the generated files.


 ?

 ?

 ?2

 ?57

?

?


?

?

???  
?%
google/protobuf/duration.protogoogle.protobuf":
Duration
seconds (Rseconds
nanos (RnanosB?
com.google.protobufBDurationProtoPZ1google.golang.org/protobuf/types/known/durationpb??GPB?Google.Protobuf.WellKnownTypesJ?#
 s
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# 
	
# 

$ H
	
$ H

% ,
	
% ,

& .
	
& .

' "
	

' "

( !
	
$( !
?
 f s? A Duration represents a signed, fixed-length span of time represented
 as a count of seconds and fractions of seconds at nanosecond
 resolution. It is independent of any calendar and concepts like "day"
 or "month". It is related to Timestamp in that the difference between
 two Timestamp values is a Duration and it can be added or subtracted
 from a Timestamp. Range is approximately +-10,000 years.

 # Examples

 Example 1: Compute Duration from two Timestamps in pseudo code.

     Timestamp start = ...;
     Timestamp end = ...;
     Duration duration = ...;

     duration.seconds = end.seconds - start.seconds;
     duration.nanos = end.nanos - start.nanos;

     if (duration.seconds < 0 && duration.nanos > 0) {
       duration.seconds += 1;
       duration.nanos -= 1000000000;
     } else if (duration.seconds > 0 && duration.nanos < 0) {
       duration.seconds -= 1;
       duration.nanos += 1000000000;
     }

 Example 2: Compute Timestamp from Timestamp + Duration in pseudo code.

     Timestamp start = ...;
     Duration duration = ...;
     Timestamp end = ...;

     end.seconds = start.seconds + duration.seconds;
     end.nanos = start.nanos + duration.nanos;

     if (end.nanos < 0) {
       end.seconds -= 1;
       end.nanos += 1000000000;
     } else if (end.nanos >= 1000000000) {
       end.seconds += 1;
       end.nanos -= 1000000000;
     }

 Example 3: Compute Duration from datetime.timedelta in Python.

     td = datetime.timedelta(days=3, minutes=10)
     duration = Duration()
     duration.FromTimedelta(td)

 # JSON Mapping

 In JSON format, the Duration type is encoded as a string rather than an
 object, where the string ends in the suffix "s" (indicating seconds) and
 is preceded by the number of seconds, with nanoseconds expressed as
 fractional seconds. For example, 3 seconds with 0 nanoseconds should be
 encoded in JSON format as "3s", while 3 seconds and 1 nanosecond should
 be expressed in JSON format as "3.000000001s", and 3 seconds and 1
 microsecond should be expressed in JSON format as "3.000001s".





 f
?
  j? Signed seconds of the span of time. Must be from -315,576,000,000
 to +315,576,000,000 inclusive. Note: these bounds are computed from:
 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years


  j

  j

  j
?
 r? Signed fractions of a second at nanosecond resolution of the span
 of time. Durations less than one second are represented with a 0
 `seconds` field and a positive or negative `nanos` field. For durations
 of one second or more, a non-zero value for the `nanos` field must be
 of the same sign as the `seconds` field. Must be from -999,999,999
 to +999,999,999 inclusive.


 r

 r

 rbproto3??  
?=
 google/protobuf/field_mask.protogoogle.protobuf"!
	FieldMask
paths (	RpathsB?
com.google.protobufBFieldMaskProtoPZ2google.golang.org/protobuf/types/known/fieldmaskpb??GPB?Google.Protobuf.WellKnownTypesJ?;
 ?
?
 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# ,
	
# ,

$ /
	
$ /

% "
	

% "

& !
	
$& !

' I
	
' I

( 
	
( 
?,
 ? ??, `FieldMask` represents a set of symbolic field paths, for example:

     paths: "f.a"
     paths: "f.b.d"

 Here `f` represents a field in some root message, `a` and `b`
 fields in the message found in `f`, and `d` a field found in the
 message in `f.b`.

 Field masks are used to specify a subset of fields that should be
 returned by a get operation or modified by an update operation.
 Field masks also have a custom JSON encoding (see below).

 # Field Masks in Projections

 When used in the context of a projection, a response message or
 sub-message is filtered by the API to only contain those fields as
 specified in the mask. For example, if the mask in the previous
 example is applied to a response message as follows:

     f {
       a : 22
       b {
         d : 1
         x : 2
       }
       y : 13
     }
     z: 8

 The result will not contain specific values for fields x,y and z
 (their value will be set to the default, and omitted in proto text
 output):


     f {
       a : 22
       b {
         d : 1
       }
     }

 A repeated field is not allowed except at the last position of a
 paths string.

 If a FieldMask object is not present in a get operation, the
 operation applies to all fields (as if a FieldMask of all fields
 had been specified).

 Note that a field mask does not necessarily apply to the
 top-level response message. In case of a REST get operation, the
 field mask applies directly to the response, but in case of a REST
 list operation, the mask instead applies to each individual message
 in the returned resource list. In case of a REST custom method,
 other definitions may be used. Where the mask applies will be
 clearly documented together with its declaration in the API.  In
 any case, the effect on the returned resource/resources is required
 behavior for APIs.

 # Field Masks in Update Operations

 A field mask in update operations specifies which fields of the
 targeted resource are going to be updated. The API is required
 to only change the values of the fields as specified in the mask
 and leave the others untouched. If a resource is passed in to
 describe the updated values, the API ignores the values of all
 fields not covered by the mask.

 If a repeated field is specified for an update operation, new values will
 be appended to the existing repeated field in the target resource. Note that
 a repeated field is only allowed in the last position of a `paths` string.

 If a sub-message is specified in the last position of the field mask for an
 update operation, then new value will be merged into the existing sub-message
 in the target resource.

 For example, given the target message:

     f {
       b {
         d: 1
         x: 2
       }
       c: [1]
     }

 And an update message:

     f {
       b {
         d: 10
       }
       c: [2]
     }

 then if the field mask is:

  paths: ["f.b", "f.c"]

 then the result will be:

     f {
       b {
         d: 10
         x: 2
       }
       c: [1, 2]
     }

 An implementation may provide options to override this default behavior for
 repeated and message fields.

 In order to reset a field's value to the default, the field must
 be in the mask and set to the default value in the provided resource.
 Hence, in order to reset all fields of a resource, provide a default
 instance of the resource and set all fields in the mask, or do
 not provide a mask as described below.

 If a field mask is not present on update, the operation applies to
 all fields (as if a field mask of all fields has been specified).
 Note that in the presence of schema evolution, this may mean that
 fields the client does not know and has therefore not filled into
 the request will be reset to their default. If this is unwanted
 behavior, a specific service may require a client to always specify
 a field mask, producing an error if not.

 As with get operations, the location of the resource which
 describes the updated values in the request message depends on the
 operation kind. In any case, the effect of the field mask is
 required to be honored by the API.

 ## Considerations for HTTP REST

 The HTTP kind of an update operation which uses a field mask must
 be set to PATCH instead of PUT in order to satisfy HTTP semantics
 (PUT must only be used for full updates).

 # JSON Encoding of Field Masks

 In JSON, a field mask is encoded as a single string where paths are
 separated by a comma. Fields name in each path are converted
 to/from lower-camel naming conventions.

 As an example, consider the following message declarations:

     message Profile {
       User user = 1;
       Photo photo = 2;
     }
     message User {
       string display_name = 1;
       string address = 2;
     }

 In proto a field mask for `Profile` may look as such:

     mask {
       paths: "user.display_name"
       paths: "photo"
     }

 In JSON, the same mask is represented as below:

     {
       mask: "user.displayName,photo"
     }

 # Field Masks and Oneof Fields

 Field masks treat fields in oneofs just as regular fields. Consider the
 following message:

     message SampleMessage {
       oneof test_oneof {
         string name = 4;
         SubMessage sub_message = 9;
       }
     }

 The field mask can be:

     mask {
       paths: "name"
     }

 Or:

     mask {
       paths: "sub_message"
     }

 Note that oneof type names ("test_oneof" in this case) cannot be used in
 paths.

 ## Field Mask Verification

 The implementation of any API method which has a FieldMask type field in the
 request should verify the included field paths, and return an
 `INVALID_ARGUMENT` error if any path is unmappable.


 ?
,
  ? The set of field mask paths.


  ?


  ?

  ?

  ?bproto3??  
?#
google/protobuf/wrappers.protogoogle.protobuf"#
DoubleValue
value (Rvalue""

FloatValue
value (Rvalue""

Int64Value
value (Rvalue"#
UInt64Value
value (Rvalue""

Int32Value
value (Rvalue"#
UInt32Value
value (Rvalue"!
	BoolValue
value (Rvalue"#
StringValue
value (	Rvalue""

BytesValue
value (RvalueB?
com.google.protobufBWrappersProtoPZ1google.golang.org/protobuf/types/known/wrapperspb??GPB?Google.Protobuf.WellKnownTypesJ?
( z
?
( 2? Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
2? Wrappers for primitive (non-message) types. These types are useful
 for embedding primitives in the `google.protobuf.Any` type and for places
 where we need to distinguish between the absence of a primitive
 typed field and its default value.

 These wrappers have no meaningful use within repeated fields as they lack
 the ability to detect presence on individual elements.
 These wrappers have no meaningful use within a map or a oneof since
 individual entries of a map or fields of a oneof can already detect presence.


* 

, ;
	
%, ;

- 
	
- 

. H
	
. H

/ ,
	
/ ,

0 .
	
0 .

1 "
	

1 "

2 !
	
$2 !
g
 7 :[ Wrapper message for `double`.

 The JSON representation for `DoubleValue` is JSON number.



 7
 
  9 The double value.


  9

  9	

  9
e
? BY Wrapper message for `float`.

 The JSON representation for `FloatValue` is JSON number.



?

 A The float value.


 A

 A

 A
e
G JY Wrapper message for `int64`.

 The JSON representation for `Int64Value` is JSON string.



G

 I The int64 value.


 I

 I

 I
g
O R[ Wrapper message for `uint64`.

 The JSON representation for `UInt64Value` is JSON string.



O
 
 Q The uint64 value.


 Q

 Q	

 Q
e
W ZY Wrapper message for `int32`.

 The JSON representation for `Int32Value` is JSON number.



W

 Y The int32 value.


 Y

 Y

 Y
g
_ b[ Wrapper message for `uint32`.

 The JSON representation for `UInt32Value` is JSON number.



_
 
 a The uint32 value.


 a

 a	

 a
o
g jc Wrapper message for `bool`.

 The JSON representation for `BoolValue` is JSON `true` and `false`.



g

 i The bool value.


 i

 i

 i
g
o r[ Wrapper message for `string`.

 The JSON representation for `StringValue` is JSON string.



o
 
 q The string value.


 q

 q	

 q
e
w zY Wrapper message for `bytes`.

 The JSON representation for `BytesValue` is JSON string.



w

 y The bytes value.


 y

 y

 ybproto3??  
?9
google/rpc/code.proto
google.rpc*?
Code
OK 
	CANCELLED
UNKNOWN
INVALID_ARGUMENT
DEADLINE_EXCEEDED
	NOT_FOUND
ALREADY_EXISTS
PERMISSION_DENIED
UNAUTHENTICATED
RESOURCE_EXHAUSTED
FAILED_PRECONDITION	
ABORTED

OUT_OF_RANGE
UNIMPLEMENTED
INTERNAL
UNAVAILABLE
	DATA_LOSSBX
com.google.rpcB	CodeProtoPZ3google.golang.org/genproto/googleapis/rpc/code;code?RPCJ?5
 ?
?
 2? Copyright 2020 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 

 J
	
 J

 "
	

 "

 *
	
 *

 '
	
 '

 !
	
$ !
?
  ?? The canonical error codes for gRPC APIs.


 Sometimes multiple error codes may apply.  Services should return
 the most specific error code that applies.  For example, prefer
 `OUT_OF_RANGE` over `FAILED_PRECONDITION` if both codes apply.
 Similarly prefer `NOT_FOUND` or `ALREADY_EXISTS` over `FAILED_PRECONDITION`.



 	
G
  #	: Not an error; returned on success

 HTTP Mapping: 200 OK


  #

  #
n
 (a The operation was cancelled, typically by the caller.

 HTTP Mapping: 499 Client Closed Request


 (

 (
?
 1? Unknown error.  For example, this error may be returned when
 a `Status` value received from another address space belongs to
 an error space that is not known in this address space.  Also
 errors raised by APIs that do not return enough error information
 may be converted to this error.

 HTTP Mapping: 500 Internal Server Error


 1	

 1
?
 9? The client specified an invalid argument.  Note that this differs
 from `FAILED_PRECONDITION`.  `INVALID_ARGUMENT` indicates arguments
 that are problematic regardless of the state of the system
 (e.g., a malformed file name).

 HTTP Mapping: 400 Bad Request


 9

 9
?
 B? The deadline expired before the operation could complete. For operations
 that change the state of the system, this error may be returned
 even if the operation has completed successfully.  For example, a
 successful response from a server could have been delayed long
 enough for the deadline to expire.

 HTTP Mapping: 504 Gateway Timeout


 B

 B
?
 M? Some requested entity (e.g., file or directory) was not found.

 Note to server developers: if a request is denied for an entire class
 of users, such as gradual feature rollout or undocumented whitelist,
 `NOT_FOUND` may be used. If a request is denied for some users within
 a class of users, such as user-based access control, `PERMISSION_DENIED`
 must be used.

 HTTP Mapping: 404 Not Found


 M

 M
?
 Sv The entity that a client attempted to create (e.g., file or directory)
 already exists.

 HTTP Mapping: 409 Conflict


 S

 S
?
 _? The caller does not have permission to execute the specified
 operation. `PERMISSION_DENIED` must not be used for rejections
 caused by exhausting some resource (use `RESOURCE_EXHAUSTED`
 instead for those errors). `PERMISSION_DENIED` must not be
 used if the caller can not be identified (use `UNAUTHENTICATED`
 instead for those errors). This error code does not imply the
 request is valid or the requested entity exists or satisfies
 other pre-conditions.

 HTTP Mapping: 403 Forbidden


 _

 _
~
 eq The request does not have valid authentication credentials for the
 operation.

 HTTP Mapping: 401 Unauthorized


 e

 e
?
 	k? Some resource has been exhausted, perhaps a per-user quota, or
 perhaps the entire file system is out of space.

 HTTP Mapping: 429 Too Many Requests


 	k

 	k
?
 
? The operation was rejected because the system is not in a state
 required for the operation's execution.  For example, the directory
 to be deleted is non-empty, an rmdir operation is applied to
 a non-directory, etc.

 Service implementors can use the following guidelines to decide
 between `FAILED_PRECONDITION`, `ABORTED`, and `UNAVAILABLE`:
  (a) Use `UNAVAILABLE` if the client can retry just the failing call.
  (b) Use `ABORTED` if the client should retry at a higher level
      (e.g., when a client-specified test-and-set fails, indicating the
      client should restart a read-modify-write sequence).
  (c) Use `FAILED_PRECONDITION` if the client should not retry until
      the system state has been explicitly fixed.  E.g., if an "rmdir"
      fails because the directory is non-empty, `FAILED_PRECONDITION`
      should be returned since the client should not retry unless
      the files are deleted from the directory.

 HTTP Mapping: 400 Bad Request


 


 

?
 ?? The operation was aborted, typically due to a concurrency issue such as
 a sequencer check failure or transaction abort.

 See the guidelines above for deciding between `FAILED_PRECONDITION`,
 `ABORTED`, and `UNAVAILABLE`.

 HTTP Mapping: 409 Conflict


 ?	

 ?
?
 ?? The operation was attempted past the valid range.  E.g., seeking or
 reading past end-of-file.

 Unlike `INVALID_ARGUMENT`, this error indicates a problem that may
 be fixed if the system state changes. For example, a 32-bit file
 system will generate `INVALID_ARGUMENT` if asked to read at an
 offset that is not in the range [0,2^32-1], but it will generate
 `OUT_OF_RANGE` if asked to read from an offset past the current
 file size.

 There is a fair bit of overlap between `FAILED_PRECONDITION` and
 `OUT_OF_RANGE`.  We recommend using `OUT_OF_RANGE` (the more specific
 error) when it applies so that callers who are iterating through
 a space can easily look for an `OUT_OF_RANGE` error to detect when
 they are done.

 HTTP Mapping: 400 Bad Request


 ?

 ?
?
 ?t The operation is not implemented or is not supported/enabled in this
 service.

 HTTP Mapping: 501 Not Implemented


 ?

 ?
?
 ?? Internal errors.  This means that some invariants expected by the
 underlying system have been broken.  This error code is reserved
 for serious errors.

 HTTP Mapping: 500 Internal Server Error


 ?


 ?
?
 ?? The service is currently unavailable.  This is most likely a
 transient condition, which can be corrected by retrying with
 a backoff. Note that it is not always safe to retry
 non-idempotent operations.

 See the guidelines above for deciding between `FAILED_PRECONDITION`,
 `ABORTED`, and `UNAVAILABLE`.

 HTTP Mapping: 503 Service Unavailable


 ?

 ?
`
 ?R Unrecoverable data loss or corruption.

 HTTP Mapping: 500 Internal Server Error


 ?

 ?bproto3??  
?X
google/rpc/error_details.proto
google.rpcgoogle/protobuf/duration.proto"G
	RetryInfo:
retry_delay (2.google.protobuf.DurationR
retryDelay"H
	DebugInfo#
stack_entries (	RstackEntries
detail (	Rdetail"?
QuotaFailureB

violations (2".google.rpc.QuotaFailure.ViolationR
violationsG
	Violation
subject (	Rsubject 
description (	Rdescription"?
	ErrorInfo
reason (	Rreason
domain (	Rdomain?
metadata (2#.google.rpc.ErrorInfo.MetadataEntryRmetadata;
MetadataEntry
key (	Rkey
value (	Rvalue:8"?
PreconditionFailureI

violations (2).google.rpc.PreconditionFailure.ViolationR
violations[
	Violation
type (	Rtype
subject (	Rsubject 
description (	Rdescription"?

BadRequestP
field_violations (2%.google.rpc.BadRequest.FieldViolationRfieldViolationsH
FieldViolation
field (	Rfield 
description (	Rdescription"O
RequestInfo

request_id (	R	requestId!
serving_data (	RservingData"?
ResourceInfo#
resource_type (	RresourceType#
resource_name (	RresourceName
owner (	Rowner 
description (	Rdescription"o
Help+
links (2.google.rpc.Help.LinkRlinks:
Link 
description (	Rdescription
url (	Rurl"D
LocalizedMessage
locale (	Rlocale
message (	RmessageBl
com.google.rpcBErrorDetailsProtoPZ?google.golang.org/genproto/googleapis/rpc/errdetails;errdetails?RPCJ?M
 ?
?
 2? Copyright 2020 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 
	
  (

 V
	
 V

 "
	

 "

 2
	
 2

 '
	
 '

 !
	
$ !
?
 ' *? Describes when the clients can retry a failed request. Clients could ignore
 the recommendation here or retry when this information is missing from error
 responses.

 It's always recommended that clients should use exponential backoff when
 retrying.

 Clients should wait until `retry_delay` amount of time has passed since
 receiving the error response before retrying.  If retrying requests also
 fail, clients should use an exponential backoff scheme to gradually increase
 the delay between retries based on `retry_delay`, until either a maximum
 number of retries have been reached or a maximum retry delay cap has been
 reached.



 '
X
  )+K Clients should wait at least this long between retrying the same request.


  )

  )&

  ))*
2
- 3& Describes additional debugging info.



-
K
 /$> The stack trace entries indicating where the error occurred.


 /


 /

 /

 /"#
G
2: Additional debugging information provided by the server.


2

2	

2
?
@ U? Describes how a quota check failed.

 For example if a daily limit was exceeded for the calling project,
 a service could respond with a QuotaFailure detail containing the project
 id and the description of the quota limit that was exceeded.  If the
 calling project hasn't enabled the service in the developer console, then
 a service could respond with the project id and set `service_disabled`
 to true.

 Also see RetryInfo and Help types for other details about handling a
 quota failure.



@
?
 CQ} A message type used to describe a single quota violation.  For example, a
 daily quota or a custom quota that was exceeded.


 C

?
  G? The subject on which the quota check failed.
 For example, "clientip:<ip address of client>" or "project:<Google
 developer project id>".


  G


  G

  G
?
 P? A description of how the quota check failed. Clients can use this
 description to find more about the quota configuration in the service's
 public documentation, or find the relevant quota limit to adjust through
 developer console.

 For example: "Service disabled" or "Daily Limit for read operations
 exceeded".


 P


 P

 P
.
 T$! Describes all quota violations.


 T


 T

 T

 T"#
?
m ?? Describes the cause of the error with structured details.

 Example of an error when contacting the "pubsub.googleapis.com" API when it
 is not enabled:
     { "reason": "API_DISABLED"
       "domain": "googleapis.com"
       "metadata": {
         "resource": "projects/123",
         "service": "pubsub.googleapis.com"
       }
     }
 This response indicates that the pubsub.googleapis.com API is not enabled.

 Example of an error that is returned when attempting to create a Spanner
 instance in a region that is out of stock:
     { "reason": "STOCKOUT"
       "domain": "spanner.googleapis.com",
       "metadata": {
         "availableRegions": "us-central1,us-east2"
       }
     }




m
?
 r? The reason of the error. This is a constant value that identifies the
 proximate cause of the error. Error reasons are unique within a particular
 domain of errors. This should be at most 63 characters and match
 /[A-Z0-9_]+/.


 r

 r	

 r
?
y? The logical grouping to which the "reason" belongs.  Often "domain" will
 contain the registered service name of the tool or product that is the
 source of the error. Example: "pubsub.googleapis.com". If the error is
 common across many APIs, the first segment of the example above will be
 omitted.  The value will be, "googleapis.com".


y

y	

y
?
?#? Additional structured details about this error.

 Keys should match /[a-zA-Z0-9-_]/ and be limited to 64 characters in
 length. When identifying the current value of an exceeded limit, the units
 should be contained in the key, not the value.  For example, rather than
 {"instanceLimit": "100/request"}, should be returned as,
 {"instanceLimitPerRequest": "100"}, if the client exceeds the number of
 instances that can be created in a single (batch) request.


?

?

?!"
?
? ?? Describes what preconditions have failed.

 For example, if an RPC failed because it required the Terms of Service to be
 acknowledged, it could list the terms of service violation in the
 PreconditionFailure message.


?
P
 ??@ A message type used to describe a single precondition failure.


 ?

?
  ?? The type of PreconditionFailure. We recommend using a service-specific
 enum type to define the supported precondition violation subjects. For
 example, "TOS" for "Terms of Service violation".


  ?


  ?

  ?
?
 ?? The subject, relative to the type, that failed.
 For example, "google.com/cloud" relative to the "TOS" type would indicate
 which terms of service is being referenced.


 ?


 ?

 ?
?
 ?? A description of how the precondition failed. Developers can use this
 description to understand how to fix the failure.

 For example: "Terms of service not accepted".


 ?


 ?

 ?
6
 ?$( Describes all precondition violations.


 ?


 ?

 ?

 ?"#
{
? ?m Describes violations in a client request. This error type focuses on the
 syntactic aspects of the request.


?
M
 ??= A message type used to describe a single bad request field.


 ?

?
  ?? A path leading to a field in the request body. The value will be a
 sequence of dot-separated identifiers that identify a protocol buffer
 field. E.g., "field_violations.field" would identify this field.


  ?


  ?

  ?
B
 ?2 A description of why the request element is bad.


 ?


 ?

 ?
=
 ?// Describes all violations in a client request.


 ?


 ?

 ?*

 ?-.
?
? ?v Contains metadata about the request that clients can attach when filing a bug
 or providing other forms of feedback.


?
?
 ?? An opaque string that should only be interpreted by the service generating
 it. For example, it can be used to identify requests in the service's logs.


 ?

 ?	

 ?
?
?? Any data that was used to serve this request. For example, an encrypted
 stack trace that can be sent back to the service provider for debugging.


?

?	

?
>
? ?0 Describes the resource that is being accessed.


?
?
 ?? A name for the type of resource being accessed, e.g. "sql table",
 "cloud storage bucket", "file", "Google calendar"; or the type URL
 of the resource: e.g. "type.googleapis.com/google.pubsub.v1.Topic".


 ?

 ?	

 ?
?
?? The name of the resource being accessed.  For example, a shared calendar
 name: "example.com_4fghdhgsrgh@group.calendar.google.com", if the current
 error is [google.rpc.Code.PERMISSION_DENIED][google.rpc.Code.PERMISSION_DENIED].


?

?	

?
?
?w The owner of the resource (optional).
 For example, "user:<owner email>" or "project:<Google developer project
 id>".


?

?	

?
?
?? Describes what error is encountered when accessing this resource.
 For example, updating a cloud project may require the `writer` permission
 on the developer console project.


?

?	

?
?
? ?? Provides links to documentation or for performing an out of band action.

 For example, if a quota check failed with an error indicating the calling
 project hasn't enabled the accessed service, this can contain a URL pointing
 directly to the right place in the developer console to flip the bit.


?
'
 ?? Describes a URL link.


 ?

1
  ?! Describes what the link offers.


  ?


  ?

  ?
&
 ? The URL of the link.


 ?


 ?

 ?
X
 ?J URL(s) pointing to additional information on handling the current error.


 ?


 ?

 ?

 ?
}
	? ?o Provides a localized error message that is safe to return to the user
 which can be attached to an RPC error.


	?
?
	 ?? The locale used following the specification defined at
 http://www.rfc-editor.org/rfc/bcp/bcp47.txt.
 Examples are: "en-US", "fr-CH", "es-MX"


	 ?

	 ?	

	 ?
@
	?2 The localized error message in the above locale.


	?

	?	

	?bproto3??  
?
google/rpc/status.proto
google.rpcgoogle/protobuf/any.proto"f
Status
code (Rcode
message (	Rmessage.
details (2.google.protobuf.AnyRdetailsBa
com.google.rpcBStatusProtoPZ7google.golang.org/genproto/googleapis/rpc/status;status??RPCJ?
 .
?
 2? Copyright 2020 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 
	
  #

 
	
 

 N
	
 N

 "
	

 "

 ,
	
 ,

 '
	
 '

 !
	
$ !
?
 " .? The `Status` type defines a logical error model that is suitable for
 different programming environments, including REST APIs and RPC APIs. It is
 used by [gRPC](https://github.com/grpc). Each `Status` message contains
 three pieces of data: error code, error message, and error details.

 You can find out more about this error model and how to work with it in the
 [API Design Guide](https://cloud.google.com/apis/design/errors).



 "
d
  $W The status code, which should be an enum value of [google.rpc.Code][google.rpc.Code].


  $

  $

  $
?
 )? A developer-facing error message, which should be in English. Any
 user-facing error message should be localized and sent in the
 [google.rpc.Status.details][google.rpc.Status.details] field, or localized by the client.


 )

 )	

 )
y
 -+l A list of messages that carry the error details.  There is a common set of
 message types for APIs to use.


 -


 -

 -&

 -)*bproto3??  