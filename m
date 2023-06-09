From: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/5] dt-bindings: reserved-memory: Add
 alloc-{bottom-up,top-down}
Date: Fri, 9 Jun 2023 11:16:01 +0200
Message-ID: <ZILt0X0uyIyUdxqH@gerhold.net>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
 <20230510-dt-resv-bottom-up-v1-1-3bf68873dbed@gerhold.net>
 <20230608140256.GA2478894-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686302169;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cFQbLbyvtb+7vRaDwiI38SIMC1GtC+PMQwqtrhuglHQ=;
    b=oCPc4dj6cKe7Abcvcp+prKo21oSMeKqxFBcDa1vVpucXhEWRV8Ns0vyUOpFFJSy1+/
    TkzV70Jvhm07Mu0Bb4zmbNOUaMfzH9YX9vZnytc4G+lkNdVQZ866mgNt9KR/0seUix+j
    s9QEurULqfYcuopf1XT0XTJg5pykvMfCEGZLC6N1GhyrwxMKuHNUAnktgZwoFJvjWBAX
    rrhpJPhgXNZGIsSMYx5waovyGdpO6OsyDndOvkn2Wi8mTTzqRFEapTwf9GZWx+o6TKe2
    /Bu4D3SUqQ+1nVi5AD4b59ef+I2VxbSFxtFr8lcdwuj7v2VI4TC4g5f4kCG8DAKdl5o6
    mefg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686302169;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cFQbLbyvtb+7vRaDwiI38SIMC1GtC+PMQwqtrhuglHQ=;
    b=aXHPqQIfD2xRzV4RemoO+JVZvuvglTue5BoIML/a5QOV0Hp3JDN4CAchnpx1ZckNLT
    Xaj9fxDJbdZ0qYeVUYCQ==
Content-Disposition: inline
In-Reply-To: <20230608140256.GA2478894-robh@kernel.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org

Hi Rob,

Thanks for your suggestions!

On Thu, Jun 08, 2023 at 08:02:56AM -0600, Rob Herring wrote:
> On Mon, May 15, 2023 at 12:12:16PM +0200, Stephan Gerhold wrote:
> > Right now the allocation behavior for dynamic reserved memory is
> > implementation-defined. On Linux it is dependent on the architecture.
> > This is usually fine if the address is completely arbitrary.
> > 
> > However, when using "alloc-ranges" it is helpful to allow controlling
> > this. That way you can make sure that the reservations are placed next
> > to other (static) allocations to keep the free memory contiguous if
> > possible.
> 
> That should already be possible with all the information you 
> already have. IOW, you are looking at all the region and "alloc-ranges" 
> addresses to decide top-down or bottom-up. Why can't the kernel do that.
> 

Would you accept a patch implementing such a behavior?

There are obviously infinitely complicated algorithms possible for the
allocation. A fairly simple one would be to check if the "alloc-ranges"
overlap or are adjacent to an already existing reservation, i.e.

  1. If the "alloc-range" starts at the end or inside an existing
     reservation, use bottom-up.
  2. If the "alloc-range" ends at the start or inside an existing
     reservation, use top-down.
  3. If both or none is the case, keep current (implementation-defined)
     behavior.

For reference, here are some examples how it behaves. |...| is the
unallocated memory, RRR existing allocations, and each RRR--- line
below a requested alloc-range (and where it was allocated):

Bottom-up (rule 1):
  |.....RRRR................RRRRRRRRR...........|
            RRR----
         ---RRR-------

Top-down (rule 2):
  |.....RRRR................RRRRRRRRR...........|
                     ----RRR
                ---------RRR------

Otherwise rule 3 just behaves as currently where either bottom-up
or top-down is used depending on the implementation/architecture:
  |.....RRRR................RRRRRRRRR...........|
               -----RRR
     or        RRR-----
          ---------------RRR----
     or   --RRR-----------------

There are plenty of edge cases where it doesn't produce the optimal
result, but it just results in exactly the same behavior as currently
so it's not any worse (with rule 3):

  |.....RRRR................RRRRRRRRR...........|
                          -----------RRR-----
                 or       ----------------RRR
                     ---------------------RRR  (no way to handle this
                 or  RRR---------------------   with top-down/bottom-up)

> Alternatively, if you really care about the allocation locations, don't 
> use dynamic regions.
> 

Yes, this is the option used at the moment. As outlined in detail in the
examples of RFC PATCH 4/5 and 5/5 I would like a solution inbetween. The
exact address doesn't matter but the way (direction) the region is
filled should preferably stay the same.

> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  .../bindings/reserved-memory/reserved-memory.yaml  | 39 ++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> > index c680e397cfd2..56f4bc6137e7 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> > @@ -52,6 +52,18 @@ properties:
> >        Address and Length pairs. Specifies regions of memory that are
> >        acceptable to allocate from.
> >  
> > +  alloc-bottom-up:
> > +    type: boolean
> > +    description: >
> > +      Specifies that the memory region should be preferably allocated
> > +      at the lowest available address within the "alloc-ranges" region.
> > +
> > +  alloc-top-down:
> > +    type: boolean
> > +    description: >
> > +      Specifies that the memory region should be preferably allocated
> > +      at the highest available address within the "alloc-ranges" region.
> 
> What happens when both are set?
> 

They are not meant to be both set. I should have added an if statement
for this, sorry about that.

Thanks,
Stephan
