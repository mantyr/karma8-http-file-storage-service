package utils

import (
	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/subjects"
	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
)

// ConvertGRPCToSubject преобразовывает grpc.SubjectType в string
func ConvertGRPCToSubject(subjectType api.Type) string {
	switch subjectType {
	case api.Type_TYPE_USER:
		return "user"
	case api.Type_TYPE_SERVICE_ACCOUNT:
		return "service_account"
	default:
		return ""
	}
}

// ConvertSubjectToGRPC преобразовывает subjects.Type в grpc.SubjectType
func ConvertSubjectToGRPC(subjectType subjects.Type) api.Type {
	switch subjectType {
	case "user":
		return api.Type_TYPE_USER
	case "service_account":
		return api.Type_TYPE_SERVICE_ACCOUNT
	default:
		return api.Type_TYPE_UNSPECIFIED
	}
}
