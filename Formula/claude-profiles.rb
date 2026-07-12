class ClaudeProfiles < Formula
  desc "Switch Claude Code agent context — skills, instructions, MCP servers — per project"
  homepage "https://github.com/bobobowis/claude-profiles"
  url "https://github.com/bobobowis/claude-profiles/releases/download/v0.5/claude-profiles"
  sha256 "016f4fe115d58acebd8b305a60db5c0ea547ed4d27cbe573e90e3b9fa33e83d2"
  version "0.5"
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
