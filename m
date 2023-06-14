From: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Subject: [PATCH v2 0/2] of: reserved_mem: Improve range allocations
Date: Wed, 14 Jun 2023 21:20:41 +0200
Message-ID: <20230510-dt-resv-bottom-up-v2-0-aeb2afc8ac25@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686770450;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=neT+DUbNGXFd7YKRPRpjpjhGQIXjCgnsy9pZLG/vLm4=;
    b=X7KvdbOmhGO+0OOTZWBq8HzMelMX9FHmfXUKM6CfQ3t5F/J/VndmrOSTAGVYMgIqe6
    xUO4SrOnM9Ky1QpPmhosywor8AgUWa0F0H/aCkB8CVzyk0o9uf2Csp7KsGcWB3RZAFIH
    fX3PbDJRotywZpqrlvFJMUmqJLVuu3C/y6OHQKl5TLC3IN7HW67uhQQIjF9fEDmubRyS
    DOLUY4U+Hh79fkxCF4eRsW0miUOC6aAOO2ms6vrvWXGmSDMhiL2gHrKBMO+Xexl8CRYW
    81pfuxYTX/ycWKW15I6Nb2rWeZj0UR/0jvGAAYTUfA6FE4nXvgraH9fG9S4oZMi33jJf
    r05w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686770450;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=neT+DUbNGXFd7YKRPRpjpjhGQIXjCgnsy9pZLG/vLm4=;
    b=EXiQ/bZ71kQlrQ1nP9Wlb1U+xaTpZLk10kg7vn6/CPmKDd7sflwoq70S0zKMiYgwg1
    rzIfypzsPp7K0ZYIYHAA==
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>

Try to allocate dynamic reserved memory regions with "alloc-ranges" 
close to other static regions by choosing between allocating them 
bottom-up or top-down. This keeps the reserved memory regions closer 
together rather than potentially having them spread all over the RAM.

Also make the allocation order of dynamic reserved memory regions 
deterministic so it doesn't change randomly when adding unrelated 
reserved memory regions.

Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
---
Changes in v2:
- Drop explicit "allocate-bottom-up"/"allocate-top-down" properties
  Instead, try to guess in the implementation based on the already 
  available information in the DT. (Rob)
- Drop examples that were just included to show the motivation.
  They are still available on v1 if needed.
- Link to v1: https://lore.kernel.org/r/20230510-dt-resv-bottom-up-v1-0-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org

---
Stephan Gerhold (2):
      of: reserved_mem: Try to keep range allocations contiguous
      of: reserved_mem: Use stable allocation order

 drivers/of/of_reserved_mem.c | 60 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)
---
base-commit: b16049b21162bb649cdd8519642a35972b7910fe
change-id: 20230510-dt-resv-bottom-up-68d71ff6628f

Best regards,
-- 
Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>

