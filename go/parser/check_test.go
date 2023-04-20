package parser

import (
	"reflect"
	"testing"
)

func TestCSPData_CheckDeadlock(t *testing.T) {
	type fields struct {
		Event  map[int]struct{}
		Procs  map[int]string
		Next   map[int]int
		Enable map[int][]int
	}
	tests := []struct {
		name   string
		fields fields
		want   []int
		want1  bool
	}{
		{
			name: "deadlock1",
			fields: fields{
				Event: map[int]struct{}{
					1: {},
					2: {},
					3: {},
				},
				Procs: map[int]string{
					1: "1",
					2: "2",
					3: "3",
				},
				Next: map[int]int{
					1: 2,
					2: 3,
				},
				Enable: map[int][]int{
					3: {1},
				},
			},
			want:  []int{1, 2, 3, 1},
			want1: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			c := &CSPData{
				Event:  tt.fields.Event,
				Procs:  tt.fields.Procs,
				Next:   tt.fields.Next,
				Enable: tt.fields.Enable,
			}
			got, got1 := c.CheckDeadlock()
			if !reflect.DeepEqual(got, tt.want) {
				t.Errorf("CSPData.CheckDeadlock() got = %v, want %v", got, tt.want)
			}
			if got1 != tt.want1 {
				t.Errorf("CSPData.CheckDeadlock() got1 = %v, want %v", got1, tt.want1)
			}
		})
	}
}
