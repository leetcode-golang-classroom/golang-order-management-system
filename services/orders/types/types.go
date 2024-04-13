package types

import (
	"context"

	"github.com/leetcode-golang-classroom/golang-order-management-system/services/common/genproto/orders"
)

type OrderService interface {
	CreateOrder(context.Context, *orders.Order) error
}
