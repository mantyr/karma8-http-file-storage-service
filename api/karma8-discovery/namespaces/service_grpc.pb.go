// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             (unknown)
// source: karma8-discovery/namespaces/service.proto

package namespaces

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// NamespaceServiceClient is the client API for NamespaceService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type NamespaceServiceClient interface {
	// Add добавляет информацию о новом пространстве для хранения файлов
	Add(ctx context.Context, in *AddRequest, opts ...grpc.CallOption) (*AddResponse, error)
	// List возвращает список всех зарегистрированных пространств
	List(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error)
	// Get возвращает информацию о пространстве с файлами
	Get(ctx context.Context, in *GetRequest, opts ...grpc.CallOption) (*GetResponse, error)
	// Enable включает доступность пространства для использования
	Enable(ctx context.Context, in *EnableRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
	// Disable отключает доступность пространства для использования
	Disable(ctx context.Context, in *DisableRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
	// Delete удаляет информацию о пространстве
	Delete(ctx context.Context, in *DeleteRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
}

type namespaceServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewNamespaceServiceClient(cc grpc.ClientConnInterface) NamespaceServiceClient {
	return &namespaceServiceClient{cc}
}

func (c *namespaceServiceClient) Add(ctx context.Context, in *AddRequest, opts ...grpc.CallOption) (*AddResponse, error) {
	out := new(AddResponse)
	err := c.cc.Invoke(ctx, "/karma8.discovery.namespaces.v1.NamespaceService/Add", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *namespaceServiceClient) List(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error) {
	out := new(ListResponse)
	err := c.cc.Invoke(ctx, "/karma8.discovery.namespaces.v1.NamespaceService/List", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *namespaceServiceClient) Get(ctx context.Context, in *GetRequest, opts ...grpc.CallOption) (*GetResponse, error) {
	out := new(GetResponse)
	err := c.cc.Invoke(ctx, "/karma8.discovery.namespaces.v1.NamespaceService/Get", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *namespaceServiceClient) Enable(ctx context.Context, in *EnableRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/karma8.discovery.namespaces.v1.NamespaceService/Enable", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *namespaceServiceClient) Disable(ctx context.Context, in *DisableRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/karma8.discovery.namespaces.v1.NamespaceService/Disable", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *namespaceServiceClient) Delete(ctx context.Context, in *DeleteRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/karma8.discovery.namespaces.v1.NamespaceService/Delete", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// NamespaceServiceServer is the server API for NamespaceService service.
// All implementations should embed UnimplementedNamespaceServiceServer
// for forward compatibility
type NamespaceServiceServer interface {
	// Add добавляет информацию о новом пространстве для хранения файлов
	Add(context.Context, *AddRequest) (*AddResponse, error)
	// List возвращает список всех зарегистрированных пространств
	List(context.Context, *ListRequest) (*ListResponse, error)
	// Get возвращает информацию о пространстве с файлами
	Get(context.Context, *GetRequest) (*GetResponse, error)
	// Enable включает доступность пространства для использования
	Enable(context.Context, *EnableRequest) (*emptypb.Empty, error)
	// Disable отключает доступность пространства для использования
	Disable(context.Context, *DisableRequest) (*emptypb.Empty, error)
	// Delete удаляет информацию о пространстве
	Delete(context.Context, *DeleteRequest) (*emptypb.Empty, error)
}

// UnimplementedNamespaceServiceServer should be embedded to have forward compatible implementations.
type UnimplementedNamespaceServiceServer struct {
}

func (UnimplementedNamespaceServiceServer) Add(context.Context, *AddRequest) (*AddResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Add not implemented")
}
func (UnimplementedNamespaceServiceServer) List(context.Context, *ListRequest) (*ListResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method List not implemented")
}
func (UnimplementedNamespaceServiceServer) Get(context.Context, *GetRequest) (*GetResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Get not implemented")
}
func (UnimplementedNamespaceServiceServer) Enable(context.Context, *EnableRequest) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Enable not implemented")
}
func (UnimplementedNamespaceServiceServer) Disable(context.Context, *DisableRequest) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Disable not implemented")
}
func (UnimplementedNamespaceServiceServer) Delete(context.Context, *DeleteRequest) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Delete not implemented")
}

// UnsafeNamespaceServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to NamespaceServiceServer will
// result in compilation errors.
type UnsafeNamespaceServiceServer interface {
	mustEmbedUnimplementedNamespaceServiceServer()
}

func RegisterNamespaceServiceServer(s grpc.ServiceRegistrar, srv NamespaceServiceServer) {
	s.RegisterService(&NamespaceService_ServiceDesc, srv)
}

func _NamespaceService_Add_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(AddRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(NamespaceServiceServer).Add(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/karma8.discovery.namespaces.v1.NamespaceService/Add",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(NamespaceServiceServer).Add(ctx, req.(*AddRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _NamespaceService_List_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ListRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(NamespaceServiceServer).List(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/karma8.discovery.namespaces.v1.NamespaceService/List",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(NamespaceServiceServer).List(ctx, req.(*ListRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _NamespaceService_Get_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(NamespaceServiceServer).Get(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/karma8.discovery.namespaces.v1.NamespaceService/Get",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(NamespaceServiceServer).Get(ctx, req.(*GetRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _NamespaceService_Enable_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(EnableRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(NamespaceServiceServer).Enable(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/karma8.discovery.namespaces.v1.NamespaceService/Enable",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(NamespaceServiceServer).Enable(ctx, req.(*EnableRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _NamespaceService_Disable_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DisableRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(NamespaceServiceServer).Disable(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/karma8.discovery.namespaces.v1.NamespaceService/Disable",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(NamespaceServiceServer).Disable(ctx, req.(*DisableRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _NamespaceService_Delete_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DeleteRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(NamespaceServiceServer).Delete(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/karma8.discovery.namespaces.v1.NamespaceService/Delete",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(NamespaceServiceServer).Delete(ctx, req.(*DeleteRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// NamespaceService_ServiceDesc is the grpc.ServiceDesc for NamespaceService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var NamespaceService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "karma8.discovery.namespaces.v1.NamespaceService",
	HandlerType: (*NamespaceServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Add",
			Handler:    _NamespaceService_Add_Handler,
		},
		{
			MethodName: "List",
			Handler:    _NamespaceService_List_Handler,
		},
		{
			MethodName: "Get",
			Handler:    _NamespaceService_Get_Handler,
		},
		{
			MethodName: "Enable",
			Handler:    _NamespaceService_Enable_Handler,
		},
		{
			MethodName: "Disable",
			Handler:    _NamespaceService_Disable_Handler,
		},
		{
			MethodName: "Delete",
			Handler:    _NamespaceService_Delete_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "karma8-discovery/namespaces/service.proto",
}
