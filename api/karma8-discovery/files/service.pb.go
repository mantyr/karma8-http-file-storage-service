// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.0
// 	protoc        (unknown)
// source: karma8-discovery/files/service.proto

package files

import (
	subjects "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/subjects"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// AddRequest это запрос на добавление информации о новом файле
type AddRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// NamespaceID это идентификатор пространства
	NamespaceId string `protobuf:"bytes,1,opt,name=namespace_id,json=namespaceId,proto3" json:"namespace_id,omitempty"`
	// FileID это идентификатор файла
	FileId string `protobuf:"bytes,2,opt,name=file_id,json=fileId,proto3" json:"file_id,omitempty"`
	// Servers это перечень серверов на которых будут храниться части файла
	Servers []string `protobuf:"bytes,3,rep,name=servers,proto3" json:"servers,omitempty"`
	// Enabled это флаг указывающий что файл доступен для использования
	Enabled bool `protobuf:"varint,4,opt,name=enabled,proto3" json:"enabled,omitempty"`
	// Creator это информация о субъекте который создал запись
	Creator *subjects.Subject `protobuf:"bytes,5,opt,name=creator,proto3" json:"creator,omitempty"`
}

func (x *AddRequest) Reset() {
	*x = AddRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *AddRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*AddRequest) ProtoMessage() {}

func (x *AddRequest) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use AddRequest.ProtoReflect.Descriptor instead.
func (*AddRequest) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{0}
}

func (x *AddRequest) GetNamespaceId() string {
	if x != nil {
		return x.NamespaceId
	}
	return ""
}

func (x *AddRequest) GetFileId() string {
	if x != nil {
		return x.FileId
	}
	return ""
}

func (x *AddRequest) GetServers() []string {
	if x != nil {
		return x.Servers
	}
	return nil
}

func (x *AddRequest) GetEnabled() bool {
	if x != nil {
		return x.Enabled
	}
	return false
}

func (x *AddRequest) GetCreator() *subjects.Subject {
	if x != nil {
		return x.Creator
	}
	return nil
}

// AddResponse это ответ на запрос на добавление информации о новом файле
type AddResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *AddResponse) Reset() {
	*x = AddResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *AddResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*AddResponse) ProtoMessage() {}

func (x *AddResponse) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use AddResponse.ProtoReflect.Descriptor instead.
func (*AddResponse) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{1}
}

// ListRequest это запрос всех зарегистрированных файлов
type ListRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *ListRequest) Reset() {
	*x = ListRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ListRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ListRequest) ProtoMessage() {}

func (x *ListRequest) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ListRequest.ProtoReflect.Descriptor instead.
func (*ListRequest) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{2}
}

// ListResponse это ответ на запрос всех зарегистрированных файлов
type ListResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Files []*File `protobuf:"bytes,1,rep,name=files,proto3" json:"files,omitempty"`
}

func (x *ListResponse) Reset() {
	*x = ListResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ListResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ListResponse) ProtoMessage() {}

func (x *ListResponse) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ListResponse.ProtoReflect.Descriptor instead.
func (*ListResponse) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{3}
}

func (x *ListResponse) GetFiles() []*File {
	if x != nil {
		return x.Files
	}
	return nil
}

// GetRequest это запрос на получение информации о файле
type GetRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// NamespaceID это идентификатор пространства
	NamespaceId string `protobuf:"bytes,1,opt,name=namespace_id,json=namespaceId,proto3" json:"namespace_id,omitempty"`
	// FileID это идентификатор файла
	FileId string `protobuf:"bytes,2,opt,name=file_id,json=fileId,proto3" json:"file_id,omitempty"`
}

func (x *GetRequest) Reset() {
	*x = GetRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetRequest) ProtoMessage() {}

func (x *GetRequest) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetRequest.ProtoReflect.Descriptor instead.
func (*GetRequest) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{4}
}

func (x *GetRequest) GetNamespaceId() string {
	if x != nil {
		return x.NamespaceId
	}
	return ""
}

func (x *GetRequest) GetFileId() string {
	if x != nil {
		return x.FileId
	}
	return ""
}

// GetByFileNameRequest это запрос на получение информации о файле по названию
type GetByFileNameRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// NamespaceID это идентификатор пространства
	NamespaceId string `protobuf:"bytes,1,opt,name=namespace_id,json=namespaceId,proto3" json:"namespace_id,omitempty"`
	// FileName это название файла
	FileName string `protobuf:"bytes,2,opt,name=file_name,json=fileName,proto3" json:"file_name,omitempty"`
}

func (x *GetByFileNameRequest) Reset() {
	*x = GetByFileNameRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetByFileNameRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetByFileNameRequest) ProtoMessage() {}

func (x *GetByFileNameRequest) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetByFileNameRequest.ProtoReflect.Descriptor instead.
func (*GetByFileNameRequest) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{5}
}

func (x *GetByFileNameRequest) GetNamespaceId() string {
	if x != nil {
		return x.NamespaceId
	}
	return ""
}

func (x *GetByFileNameRequest) GetFileName() string {
	if x != nil {
		return x.FileName
	}
	return ""
}

// GerResponse это ответ на запрос на получение информации о файле
type GetResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// File это информация о пространстве
	File *File `protobuf:"bytes,1,opt,name=file,proto3" json:"file,omitempty"`
}

func (x *GetResponse) Reset() {
	*x = GetResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetResponse) ProtoMessage() {}

func (x *GetResponse) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetResponse.ProtoReflect.Descriptor instead.
func (*GetResponse) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{6}
}

func (x *GetResponse) GetFile() *File {
	if x != nil {
		return x.File
	}
	return nil
}

// EnableRequest это запрос на включение доступности ранее выключенного файла
type EnableRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// NamespaceID это идентификатор пространства
	NamespaceId string `protobuf:"bytes,1,opt,name=namespace_id,json=namespaceId,proto3" json:"namespace_id,omitempty"`
	// FileID это идентификатор файла
	FileId string `protobuf:"bytes,2,opt,name=file_id,json=fileId,proto3" json:"file_id,omitempty"`
	// Updater это информация о субъекте который внёс последнии изменения в запись
	Updater *subjects.Subject `protobuf:"bytes,3,opt,name=updater,proto3" json:"updater,omitempty"`
}

func (x *EnableRequest) Reset() {
	*x = EnableRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[7]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *EnableRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*EnableRequest) ProtoMessage() {}

func (x *EnableRequest) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[7]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use EnableRequest.ProtoReflect.Descriptor instead.
func (*EnableRequest) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{7}
}

func (x *EnableRequest) GetNamespaceId() string {
	if x != nil {
		return x.NamespaceId
	}
	return ""
}

func (x *EnableRequest) GetFileId() string {
	if x != nil {
		return x.FileId
	}
	return ""
}

func (x *EnableRequest) GetUpdater() *subjects.Subject {
	if x != nil {
		return x.Updater
	}
	return nil
}

// DisableRequest это запрос на выключение доступности файла
type DisableRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// NamespaceID это идентификатор пространства
	NamespaceId string `protobuf:"bytes,1,opt,name=namespace_id,json=namespaceId,proto3" json:"namespace_id,omitempty"`
	// FileID это идентификатор файла
	FileId string `protobuf:"bytes,2,opt,name=file_id,json=fileId,proto3" json:"file_id,omitempty"`
	// Updater это информация о субъекте который внёс последнии изменения в запись
	Updater *subjects.Subject `protobuf:"bytes,3,opt,name=updater,proto3" json:"updater,omitempty"`
}

func (x *DisableRequest) Reset() {
	*x = DisableRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[8]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DisableRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DisableRequest) ProtoMessage() {}

func (x *DisableRequest) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[8]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DisableRequest.ProtoReflect.Descriptor instead.
func (*DisableRequest) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{8}
}

func (x *DisableRequest) GetNamespaceId() string {
	if x != nil {
		return x.NamespaceId
	}
	return ""
}

func (x *DisableRequest) GetFileId() string {
	if x != nil {
		return x.FileId
	}
	return ""
}

func (x *DisableRequest) GetUpdater() *subjects.Subject {
	if x != nil {
		return x.Updater
	}
	return nil
}

// DeleteRequest это запрос на удаление информации о файле
type DeleteRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// NamespaceID это идентификатор пространства
	NamespaceId string `protobuf:"bytes,1,opt,name=namespace_id,json=namespaceId,proto3" json:"namespace_id,omitempty"`
	// FileID это идентификатор файла
	FileId string `protobuf:"bytes,2,opt,name=file_id,json=fileId,proto3" json:"file_id,omitempty"`
	// Updater это информация о субъекте который внёс последнии изменения в запись
	Updater *subjects.Subject `protobuf:"bytes,3,opt,name=updater,proto3" json:"updater,omitempty"`
}

func (x *DeleteRequest) Reset() {
	*x = DeleteRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_karma8_discovery_files_service_proto_msgTypes[9]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeleteRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteRequest) ProtoMessage() {}

func (x *DeleteRequest) ProtoReflect() protoreflect.Message {
	mi := &file_karma8_discovery_files_service_proto_msgTypes[9]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteRequest.ProtoReflect.Descriptor instead.
func (*DeleteRequest) Descriptor() ([]byte, []int) {
	return file_karma8_discovery_files_service_proto_rawDescGZIP(), []int{9}
}

func (x *DeleteRequest) GetNamespaceId() string {
	if x != nil {
		return x.NamespaceId
	}
	return ""
}

func (x *DeleteRequest) GetFileId() string {
	if x != nil {
		return x.FileId
	}
	return ""
}

func (x *DeleteRequest) GetUpdater() *subjects.Subject {
	if x != nil {
		return x.Updater
	}
	return nil
}

var File_karma8_discovery_files_service_proto protoreflect.FileDescriptor

var file_karma8_discovery_files_service_proto_rawDesc = []byte{
	0x0a, 0x24, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2d, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65,
	0x72, 0x79, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x19, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64,
	0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76,
	0x31, 0x1a, 0x1c, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x61, 0x6e,
	0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a,
	0x1b, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66,
	0x2f, 0x65, 0x6d, 0x70, 0x74, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x21, 0x6b, 0x61,
	0x72, 0x6d, 0x61, 0x38, 0x2d, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2f, 0x66,
	0x69, 0x6c, 0x65, 0x73, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a,
	0x27, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2d, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72,
	0x79, 0x2f, 0x73, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x73, 0x2f, 0x73, 0x75, 0x62, 0x6a, 0x65,
	0x63, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xbd, 0x01, 0x0a, 0x0a, 0x41, 0x64, 0x64,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x21, 0x0a, 0x0c, 0x6e, 0x61, 0x6d, 0x65, 0x73,
	0x70, 0x61, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x6e,
	0x61, 0x6d, 0x65, 0x73, 0x70, 0x61, 0x63, 0x65, 0x49, 0x64, 0x12, 0x17, 0x0a, 0x07, 0x66, 0x69,
	0x6c, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x66, 0x69, 0x6c,
	0x65, 0x49, 0x64, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x73, 0x18, 0x03,
	0x20, 0x03, 0x28, 0x09, 0x52, 0x07, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x73, 0x12, 0x18, 0x0a,
	0x07, 0x65, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x64, 0x18, 0x04, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07,
	0x65, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x64, 0x12, 0x3f, 0x0a, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74,
	0x6f, 0x72, 0x18, 0x05, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x25, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61,
	0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x73, 0x75, 0x62, 0x6a,
	0x65, 0x63, 0x74, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x52,
	0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x6f, 0x72, 0x22, 0x0d, 0x0a, 0x0b, 0x41, 0x64, 0x64, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x0d, 0x0a, 0x0b, 0x4c, 0x69, 0x73, 0x74, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x22, 0x45, 0x0a, 0x0c, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x35, 0x0a, 0x05, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x18,
	0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x1f, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64,
	0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76,
	0x31, 0x2e, 0x46, 0x69, 0x6c, 0x65, 0x52, 0x05, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x22, 0x48, 0x0a,
	0x0a, 0x47, 0x65, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x21, 0x0a, 0x0c, 0x6e,
	0x61, 0x6d, 0x65, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x0b, 0x6e, 0x61, 0x6d, 0x65, 0x73, 0x70, 0x61, 0x63, 0x65, 0x49, 0x64, 0x12, 0x17,
	0x0a, 0x07, 0x66, 0x69, 0x6c, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x06, 0x66, 0x69, 0x6c, 0x65, 0x49, 0x64, 0x22, 0x56, 0x0a, 0x14, 0x47, 0x65, 0x74, 0x42, 0x79,
	0x46, 0x69, 0x6c, 0x65, 0x4e, 0x61, 0x6d, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12,
	0x21, 0x0a, 0x0c, 0x6e, 0x61, 0x6d, 0x65, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x6e, 0x61, 0x6d, 0x65, 0x73, 0x70, 0x61, 0x63, 0x65,
	0x49, 0x64, 0x12, 0x1b, 0x0a, 0x09, 0x66, 0x69, 0x6c, 0x65, 0x5f, 0x6e, 0x61, 0x6d, 0x65, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x66, 0x69, 0x6c, 0x65, 0x4e, 0x61, 0x6d, 0x65, 0x22,
	0x42, 0x0a, 0x0b, 0x47, 0x65, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x33,
	0x0a, 0x04, 0x66, 0x69, 0x6c, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1f, 0x2e, 0x6b,
	0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e,
	0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x46, 0x69, 0x6c, 0x65, 0x52, 0x04, 0x66,
	0x69, 0x6c, 0x65, 0x22, 0x8c, 0x01, 0x0a, 0x0d, 0x45, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x21, 0x0a, 0x0c, 0x6e, 0x61, 0x6d, 0x65, 0x73, 0x70, 0x61,
	0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x6e, 0x61, 0x6d,
	0x65, 0x73, 0x70, 0x61, 0x63, 0x65, 0x49, 0x64, 0x12, 0x17, 0x0a, 0x07, 0x66, 0x69, 0x6c, 0x65,
	0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x66, 0x69, 0x6c, 0x65, 0x49,
	0x64, 0x12, 0x3f, 0x0a, 0x07, 0x75, 0x70, 0x64, 0x61, 0x74, 0x65, 0x72, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x0b, 0x32, 0x25, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63,
	0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x73, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x73, 0x2e, 0x76,
	0x31, 0x2e, 0x53, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x52, 0x07, 0x75, 0x70, 0x64, 0x61, 0x74,
	0x65, 0x72, 0x22, 0x8d, 0x01, 0x0a, 0x0e, 0x44, 0x69, 0x73, 0x61, 0x62, 0x6c, 0x65, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x21, 0x0a, 0x0c, 0x6e, 0x61, 0x6d, 0x65, 0x73, 0x70, 0x61,
	0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x6e, 0x61, 0x6d,
	0x65, 0x73, 0x70, 0x61, 0x63, 0x65, 0x49, 0x64, 0x12, 0x17, 0x0a, 0x07, 0x66, 0x69, 0x6c, 0x65,
	0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x66, 0x69, 0x6c, 0x65, 0x49,
	0x64, 0x12, 0x3f, 0x0a, 0x07, 0x75, 0x70, 0x64, 0x61, 0x74, 0x65, 0x72, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x0b, 0x32, 0x25, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63,
	0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x73, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x73, 0x2e, 0x76,
	0x31, 0x2e, 0x53, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x52, 0x07, 0x75, 0x70, 0x64, 0x61, 0x74,
	0x65, 0x72, 0x22, 0x8c, 0x01, 0x0a, 0x0d, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x12, 0x21, 0x0a, 0x0c, 0x6e, 0x61, 0x6d, 0x65, 0x73, 0x70, 0x61, 0x63,
	0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x6e, 0x61, 0x6d, 0x65,
	0x73, 0x70, 0x61, 0x63, 0x65, 0x49, 0x64, 0x12, 0x17, 0x0a, 0x07, 0x66, 0x69, 0x6c, 0x65, 0x5f,
	0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x66, 0x69, 0x6c, 0x65, 0x49, 0x64,
	0x12, 0x3f, 0x0a, 0x07, 0x75, 0x70, 0x64, 0x61, 0x74, 0x65, 0x72, 0x18, 0x03, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x25, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f,
	0x76, 0x65, 0x72, 0x79, 0x2e, 0x73, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x73, 0x2e, 0x76, 0x31,
	0x2e, 0x53, 0x75, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x52, 0x07, 0x75, 0x70, 0x64, 0x61, 0x74, 0x65,
	0x72, 0x32, 0xca, 0x06, 0x0a, 0x0b, 0x46, 0x69, 0x6c, 0x65, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63,
	0x65, 0x12, 0x6e, 0x0a, 0x03, 0x41, 0x64, 0x64, 0x12, 0x25, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61,
	0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65,
	0x73, 0x2e, 0x76, 0x31, 0x2e, 0x41, 0x64, 0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x26, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65,
	0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x41, 0x64, 0x64, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x18, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x12, 0x22,
	0x0d, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x76, 0x31, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x3a, 0x01,
	0x2a, 0x12, 0x6e, 0x0a, 0x04, 0x4c, 0x69, 0x73, 0x74, 0x12, 0x26, 0x2e, 0x6b, 0x61, 0x72, 0x6d,
	0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c,
	0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x27, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f,
	0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x4c, 0x69,
	0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x15, 0x82, 0xd3, 0xe4, 0x93,
	0x02, 0x0f, 0x12, 0x0d, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x76, 0x31, 0x2f, 0x66, 0x69, 0x6c, 0x65,
	0x73, 0x12, 0x75, 0x0a, 0x03, 0x47, 0x65, 0x74, 0x12, 0x25, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61,
	0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65,
	0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x26, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65,
	0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x1f, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x19, 0x12,
	0x17, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x76, 0x31, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2f, 0x7b,
	0x66, 0x69, 0x6c, 0x65, 0x5f, 0x69, 0x64, 0x7d, 0x12, 0x8b, 0x01, 0x0a, 0x0d, 0x47, 0x65, 0x74,
	0x42, 0x79, 0x46, 0x69, 0x6c, 0x65, 0x4e, 0x61, 0x6d, 0x65, 0x12, 0x2f, 0x2e, 0x6b, 0x61, 0x72,
	0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69,
	0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x42, 0x79, 0x46, 0x69, 0x6c, 0x65,
	0x4e, 0x61, 0x6d, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x26, 0x2e, 0x6b, 0x61,
	0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66,
	0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x22, 0x21, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x1b, 0x12, 0x19, 0x2f, 0x61, 0x70,
	0x69, 0x2f, 0x76, 0x31, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2f, 0x67, 0x65, 0x74, 0x2d, 0x62,
	0x79, 0x2d, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x72, 0x0a, 0x06, 0x45, 0x6e, 0x61, 0x62, 0x6c, 0x65,
	0x12, 0x28, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76,
	0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x45, 0x6e, 0x61,
	0x62, 0x6c, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f,
	0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70,
	0x74, 0x79, 0x22, 0x26, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x20, 0x1a, 0x1e, 0x2f, 0x61, 0x70, 0x69,
	0x2f, 0x76, 0x31, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2f, 0x7b, 0x66, 0x69, 0x6c, 0x65, 0x5f,
	0x69, 0x64, 0x7d, 0x2f, 0x65, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x12, 0x75, 0x0a, 0x07, 0x44, 0x69,
	0x73, 0x61, 0x62, 0x6c, 0x65, 0x12, 0x29, 0x2e, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64,
	0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76,
	0x31, 0x2e, 0x44, 0x69, 0x73, 0x61, 0x62, 0x6c, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x27, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x21,
	0x1a, 0x1f, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x76, 0x31, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x2f,
	0x7b, 0x66, 0x69, 0x6c, 0x65, 0x5f, 0x69, 0x64, 0x7d, 0x2f, 0x64, 0x69, 0x73, 0x61, 0x62, 0x6c,
	0x65, 0x12, 0x6b, 0x0a, 0x06, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x12, 0x28, 0x2e, 0x6b, 0x61,
	0x72, 0x6d, 0x61, 0x38, 0x2e, 0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2e, 0x66,
	0x69, 0x6c, 0x65, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x1f, 0x82,
	0xd3, 0xe4, 0x93, 0x02, 0x19, 0x2a, 0x17, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x76, 0x31, 0x2f, 0x66,
	0x69, 0x6c, 0x65, 0x73, 0x2f, 0x7b, 0x66, 0x69, 0x6c, 0x65, 0x5f, 0x69, 0x64, 0x7d, 0x42, 0x4f,
	0x5a, 0x4d, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6d, 0x61, 0x6e,
	0x74, 0x79, 0x72, 0x2f, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2d, 0x68, 0x74, 0x74, 0x70, 0x2d,
	0x66, 0x69, 0x6c, 0x65, 0x2d, 0x73, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x2d, 0x73, 0x65, 0x72,
	0x76, 0x69, 0x63, 0x65, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x6b, 0x61, 0x72, 0x6d, 0x61, 0x38, 0x2d,
	0x64, 0x69, 0x73, 0x63, 0x6f, 0x76, 0x65, 0x72, 0x79, 0x2f, 0x66, 0x69, 0x6c, 0x65, 0x73, 0x62,
	0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_karma8_discovery_files_service_proto_rawDescOnce sync.Once
	file_karma8_discovery_files_service_proto_rawDescData = file_karma8_discovery_files_service_proto_rawDesc
)

func file_karma8_discovery_files_service_proto_rawDescGZIP() []byte {
	file_karma8_discovery_files_service_proto_rawDescOnce.Do(func() {
		file_karma8_discovery_files_service_proto_rawDescData = protoimpl.X.CompressGZIP(file_karma8_discovery_files_service_proto_rawDescData)
	})
	return file_karma8_discovery_files_service_proto_rawDescData
}

var file_karma8_discovery_files_service_proto_msgTypes = make([]protoimpl.MessageInfo, 10)
var file_karma8_discovery_files_service_proto_goTypes = []interface{}{
	(*AddRequest)(nil),           // 0: karma8.discovery.files.v1.AddRequest
	(*AddResponse)(nil),          // 1: karma8.discovery.files.v1.AddResponse
	(*ListRequest)(nil),          // 2: karma8.discovery.files.v1.ListRequest
	(*ListResponse)(nil),         // 3: karma8.discovery.files.v1.ListResponse
	(*GetRequest)(nil),           // 4: karma8.discovery.files.v1.GetRequest
	(*GetByFileNameRequest)(nil), // 5: karma8.discovery.files.v1.GetByFileNameRequest
	(*GetResponse)(nil),          // 6: karma8.discovery.files.v1.GetResponse
	(*EnableRequest)(nil),        // 7: karma8.discovery.files.v1.EnableRequest
	(*DisableRequest)(nil),       // 8: karma8.discovery.files.v1.DisableRequest
	(*DeleteRequest)(nil),        // 9: karma8.discovery.files.v1.DeleteRequest
	(*subjects.Subject)(nil),     // 10: karma8.discovery.subjects.v1.Subject
	(*File)(nil),                 // 11: karma8.discovery.files.v1.File
	(*emptypb.Empty)(nil),        // 12: google.protobuf.Empty
}
var file_karma8_discovery_files_service_proto_depIdxs = []int32{
	10, // 0: karma8.discovery.files.v1.AddRequest.creator:type_name -> karma8.discovery.subjects.v1.Subject
	11, // 1: karma8.discovery.files.v1.ListResponse.files:type_name -> karma8.discovery.files.v1.File
	11, // 2: karma8.discovery.files.v1.GetResponse.file:type_name -> karma8.discovery.files.v1.File
	10, // 3: karma8.discovery.files.v1.EnableRequest.updater:type_name -> karma8.discovery.subjects.v1.Subject
	10, // 4: karma8.discovery.files.v1.DisableRequest.updater:type_name -> karma8.discovery.subjects.v1.Subject
	10, // 5: karma8.discovery.files.v1.DeleteRequest.updater:type_name -> karma8.discovery.subjects.v1.Subject
	0,  // 6: karma8.discovery.files.v1.FileService.Add:input_type -> karma8.discovery.files.v1.AddRequest
	2,  // 7: karma8.discovery.files.v1.FileService.List:input_type -> karma8.discovery.files.v1.ListRequest
	4,  // 8: karma8.discovery.files.v1.FileService.Get:input_type -> karma8.discovery.files.v1.GetRequest
	5,  // 9: karma8.discovery.files.v1.FileService.GetByFileName:input_type -> karma8.discovery.files.v1.GetByFileNameRequest
	7,  // 10: karma8.discovery.files.v1.FileService.Enable:input_type -> karma8.discovery.files.v1.EnableRequest
	8,  // 11: karma8.discovery.files.v1.FileService.Disable:input_type -> karma8.discovery.files.v1.DisableRequest
	9,  // 12: karma8.discovery.files.v1.FileService.Delete:input_type -> karma8.discovery.files.v1.DeleteRequest
	1,  // 13: karma8.discovery.files.v1.FileService.Add:output_type -> karma8.discovery.files.v1.AddResponse
	3,  // 14: karma8.discovery.files.v1.FileService.List:output_type -> karma8.discovery.files.v1.ListResponse
	6,  // 15: karma8.discovery.files.v1.FileService.Get:output_type -> karma8.discovery.files.v1.GetResponse
	6,  // 16: karma8.discovery.files.v1.FileService.GetByFileName:output_type -> karma8.discovery.files.v1.GetResponse
	12, // 17: karma8.discovery.files.v1.FileService.Enable:output_type -> google.protobuf.Empty
	12, // 18: karma8.discovery.files.v1.FileService.Disable:output_type -> google.protobuf.Empty
	12, // 19: karma8.discovery.files.v1.FileService.Delete:output_type -> google.protobuf.Empty
	13, // [13:20] is the sub-list for method output_type
	6,  // [6:13] is the sub-list for method input_type
	6,  // [6:6] is the sub-list for extension type_name
	6,  // [6:6] is the sub-list for extension extendee
	0,  // [0:6] is the sub-list for field type_name
}

func init() { file_karma8_discovery_files_service_proto_init() }
func file_karma8_discovery_files_service_proto_init() {
	if File_karma8_discovery_files_service_proto != nil {
		return
	}
	file_karma8_discovery_files_file_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_karma8_discovery_files_service_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*AddRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*AddResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ListRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ListResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetByFileNameRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[7].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*EnableRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[8].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DisableRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_karma8_discovery_files_service_proto_msgTypes[9].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeleteRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_karma8_discovery_files_service_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   10,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_karma8_discovery_files_service_proto_goTypes,
		DependencyIndexes: file_karma8_discovery_files_service_proto_depIdxs,
		MessageInfos:      file_karma8_discovery_files_service_proto_msgTypes,
	}.Build()
	File_karma8_discovery_files_service_proto = out.File
	file_karma8_discovery_files_service_proto_rawDesc = nil
	file_karma8_discovery_files_service_proto_goTypes = nil
	file_karma8_discovery_files_service_proto_depIdxs = nil
}
