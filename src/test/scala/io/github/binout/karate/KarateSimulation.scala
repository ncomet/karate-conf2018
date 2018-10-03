package io.github.binout.karate

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._

class KarateSimulation extends Simulation {

  // In order for HTTP requests to "aggregate" correctly in the Gatling report,
  // you need to declare the URL patterns involved in your test
  val protocol = karateProtocol(
    "/actors" -> Nil,
    "/movies" -> Nil,
    "/movies/{id}" -> Nil,
    "/movies/{id}/actors" -> Nil
  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

  val actor = scenario("actor").exec(karateFeature("classpath:io/github/binout/karate/actor/actor.feature"))
  val movie = scenario("movie").exec(karateFeature("classpath:io/github/binout/karate/movie/movie.feature"))

  setUp(
    actor.inject(rampUsers(10) over (5 seconds)).protocols(protocol),
    movie.inject(rampUsers(5) over (5 seconds)).protocols(protocol),
  )

}