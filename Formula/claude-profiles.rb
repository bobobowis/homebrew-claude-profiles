class ClaudeProfiles < Formula
  desc "Switch Claude Code agent context — skills, instructions, MCP servers — per project"
  homepage "https://github.com/bobobowis/claude-profiles"
  url "https://github.com/bobobowis/claude-profiles/archive/refs/tags/v0.5.tar.gz"
  sha256 "9140cc46932705fdb2ff10152cf25ea113b6945aed45e2fe48aee1cc5be8f371"
  license "MIT"

  depends_on "python3"

  def install
    bin.install "claude-profiles"
    (bash_completion/"claude-profiles").write Utils.safe_popen_read(bin/"claude-profiles", "--completion-bash")
    (zsh_completion/"_claude-profiles").write Utils.safe_popen_read(bin/"claude-profiles", "--completion-zsh")
  end

  test do
    assert_match "Usage", shell_output("#{bin}/claude-profiles help 2>&1", 0)
    assert_match "_claude_profiles_complete", shell_output("#{bin}/claude-profiles --completion-bash")
    assert_match "compdef _claude_profiles", shell_output("#{bin}/claude-profiles --completion-zsh")
  end
end
