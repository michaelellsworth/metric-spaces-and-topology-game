import Mathlib.Tactic
import Mathlib.Util.Delaborators
import Mathlib.Topology.Instances.Real
import Mathlib.Analysis.NormedSpace.BanachSteinhaus
import Mathlib.Data.Set.Basic
import Game.Metadata

World "MetricWorld"
Level 3

Title "Topology exercise"

Introduction "Topology intro"

open Set Filter
open Topology Filter

variable {X : Type*} [MetricSpace X] (A B C : X)


Statement {A : Set X} :  interior A = A \ (frontier A) := by
  Hint "To prove to sets are equal we use the axiom of extensionality `ext`, two sets $A$ and $B$ are equal if and only they have the same members"
  ext x
  constructor
  · intro x_in_interior
    constructor
    · apply interior_subset
      exact x_in_interior
    · by_contra x_in_frontier
      rcases x_in_frontier with ⟨_, x_not_in_interior⟩
      absurd x_not_in_interior x_in_interior
      trivial
  · intro h
    rcases h with ⟨x_in_a, x_not_in_frontier⟩
    rw [frontier, Set.mem_diff, Classical.not_and_iff_or_not_not, not_not_mem] at x_not_in_frontier
    rcases x_not_in_frontier with x_not_in_closure | x_in_interior
    · exact absurd (subset_closure x_in_a) x_not_in_closure
    · exact x_in_interior
Conclusion "This theorem can be found in Mathlib as `self_diff_frontier`"

/- use these commands to add items to the game's inventory. -/

NewTactic rw rfl exact linarith ring apply dsimp intro use rcases by_contra absurd trivial constructor

NewTheorem Set.mem_diff Classical.not_and_iff_or_not_not Set.not_not_mem interior_subset
NewDefinition Metric.Ball


/- documentation for tendsto_atTop -/
TheoremDoc Metric.tendsto_atTop as "tendsto_atTop" in "Metric"
