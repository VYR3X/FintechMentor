package fsm

import (
	"github.com/looplab/fsm"
)

type StepMachine struct {
	machine *fsm.FSM
}

func NewStepMachine() *StepMachine {
	return &StepMachine{
		machine: newStepMachine(),
	}
}
func (s *StepMachine) Next(event string) error {
	return s.machine.Event(event)
}

func (s *StepMachine) Current() string {
	return s.machine.Current()
}

func newStepMachine() *fsm.FSM {
	return fsm.NewFSM(
		"INFO1",
		fsm.Events{
			// first block
			{Name: "INFO1", Src: []string{"INFO1"}, Dst: "TUTORIAL1"},

			{Name: "TUTORIAL1", Src: []string{"TUTORIAL1"}, Dst: "TEST1"},
			{Name: "TEST1", Src: []string{"TEST1"}, Dst: "TUTORIAL2"},
			{Name: "TUTORIAL2", Src: []string{"TUTORIAL2"}, Dst: "TEST2"},
			{Name: "TEST2", Src: []string{"TEST2"}, Dst: "TUTORIAL3"},
			{Name: "TUTORIAL3", Src: []string{"TUTORIAL3"}, Dst: "TEST3"},
			{Name: "TEST3", Src: []string{"TEST3"}, Dst: "TUTORIAL4"},
			{Name: "TUTORIAL4", Src: []string{"TUTORIAL4"}, Dst: "TEST4"},
			{Name: "TEST4", Src: []string{"TEST4"}, Dst: "INFO2"},

			// second block
			{Name: "INFO2", Src: []string{"INFO2"}, Dst: "TUTORIAL5"},

			{Name: "TUTORIAL5", Src: []string{"TUTORIAL5"}, Dst: "TEST5"},
			{Name: "TEST5", Src: []string{"TEST5"}, Dst: "TUTORIAL6"},
			{Name: "TUTORIAL6", Src: []string{"TUTORIAL6"}, Dst: "TEST6"},
			{Name: "TEST6", Src: []string{"TEST6"}, Dst: "TUTORIAL7"},
			{Name: "TUTORIAL7", Src: []string{"TUTORIAL7"}, Dst: "TEST7"},
			{Name: "TEST7", Src: []string{"TEST7"}, Dst: "TUTORIAL8"},
			{Name: "TUTORIAL8", Src: []string{"TUTORIAL8"}, Dst: "TEST8"},
			{Name: "TEST8", Src: []string{"TEST8"}, Dst: "RANDOM"},
			{Name: "RANDOM", Src: []string{"RANDOM"}, Dst: "RANDOM"}, //finish on random pool
		},
		fsm.Callbacks{},
	)
}
