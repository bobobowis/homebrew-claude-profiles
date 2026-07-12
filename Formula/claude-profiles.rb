class ClaudeProfiles < Formula
  desc "Switch Claude Code agent context — skills, instructions, MCP servers — per project"
  homepage "https://github.com/bobobowis/claude-profiles"
  url "https://github.com/bobobowis/claude-profiles/archive/refs/tags/v0.4.tar.gz"
  sha256 "9615261d1f2eb30435d9abb39e023099185093a349591323db63a8caee2323df"
  license "MIT"

  depends_on "python3"

  def install
    bin.install "claude-profiles"

    # Shell completions
    bash_completion.install_symlink bin/"claude-profiles" => "claude-profiles"
    generate_completions_from_executable(bin/"claude-profiles", "--completion-bash",
                                         shell_parameter_format: :none,
                                         shells: [:bash])
    generate_completions_from_executable(bin/"claude-profiles", "--completion-zsh",
                                         shell_parameter_format: :none,
                                         shells: [:zsh])
  end

  test do
    assert_match "Usage", shell_output("#{bin}/claude-profiles help 2>&1", 0)
    assert_match "_claude_profiles_complete", shell_output("#{bin}/claude-profiles --completion-bash")
    assert_match "compdef _claude_profiles", shell_output("#{bin}/claude-profiles --completion-zsh")
  end
end
