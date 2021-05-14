Feature: Plan Test

  Background:
    Given a graph with space named "nba"

  Scenario: Too deep depth execution plan
    When executing query:
      """
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3) UNION
      (GO FROM 'Tim Duncan' OVER like YIELD like._dst AS dst | LIMIT 3);
      """
    Then an ExecutionError should be raised at runtime: The depth(1046) of execution plan has exceeded 1024
