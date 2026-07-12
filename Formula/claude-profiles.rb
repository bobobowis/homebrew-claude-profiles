class ClaudeProfiles < Formula
  desc "Switch Claude Code agent context — skills, instructions, MCP servers — per project"
  homepage "https://github.com/bobobowis/claude-profiles"
  url "https://github.com/bobobowis/claude-profiles/archive/refs/tags/v0.3.tar.gz"
  sha256 "c03faf157f6fc07f0566828404ec6b2f090781b765a915d11ac99ae0df831aef"
  license "MIT"

  depends_on "python3"

  def install
    bin.install "claude-profiles"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/claude-profiles help 2>&1", 0)
  end
end
