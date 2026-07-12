class ClaudeProfiles < Formula
  desc "Switch Claude Code agent profiles — skills, rules, MCP servers"
  homepage "https://github.com/bobobowis/claude-profiles"
  url "https://github.com/bobobowis/claude-profiles/releases/download/v0.6/claude-profiles"
  sha256 "06bca313cf05cfa20076f357c95050a382fad6ae3d84cba1c884ff9232c99ea2"
  license "MIT"

  def install
    bin.install "claude-profiles"
    generate_completions_from_executable(bin/"claude-profiles", "--completion",
                                         shell_parameter_format: :arg)
  end

  test do
    assert_match "Commands", shell_output("#{bin}/claude-profiles help 2>&1")
    assert_match "_claude_profiles_complete", shell_output("#{bin}/claude-profiles --completion bash")
    assert_match "compdef _claude_profiles", shell_output("#{bin}/claude-profiles --completion zsh")
  end
end
