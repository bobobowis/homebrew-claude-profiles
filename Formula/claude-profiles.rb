class ClaudeProfiles < Formula
  desc "Switch Claude Code agent context — skills, instructions, MCP servers — per project"
  homepage "https://github.com/bobobowis/claude-profiles"
  url "https://github.com/bobobowis/claude-profiles/archive/refs/tags/v0.5.tar.gz"
  sha256 "66543e81b8a7f1f137b55fb3df79107d969d8434aa2894df02af205953480601"
  license "MIT"

  def install
    bin.install "claude-profiles"
    (bash_completion/"claude-profiles").write Utils.safe_popen_read(bin/"claude-profiles", "--completion-bash")
    (zsh_completion/"_claude-profiles").write Utils.safe_popen_read(bin/"claude-profiles", "--completion-zsh")
  end

  test do
    assert_match "Commands", shell_output("#{bin}/claude-profiles help 2>&1", 0)
    assert_match "_claude_profiles_complete", shell_output("#{bin}/claude-profiles --completion-bash")
    assert_match "compdef _claude_profiles", shell_output("#{bin}/claude-profiles --completion-zsh")
  end
end
