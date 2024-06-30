import argv
import envoy
import gleam/io
import gleam/result
import vars/internal
import wolf

pub fn main() {
  case argv.load().arguments {
    ["get", name] -> {
      get(name)
      wolf.log_to_file("Vars get Success", "log.txt", wolf.Success)
    }
    _ -> {
      wolf.info("vars get <name>")
      wolf.log_to_file("Vars get Error", "log.txt", wolf.Error)
    }
  }
}

fn get(name: String) -> Nil {
  let value =
    envoy.get(name)
    |> result.unwrap("")
  io.println(internal.format_pair(name, value))
}
